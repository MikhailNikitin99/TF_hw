
# Creating network, subnets and security group
module "vpc" {
  source = "./vpc"
  env_name = "App-Network"
  subnets = [
    {zone = "ru-central1-a",cidr = "10.0.1.0/24"}
  ]
  http_cidr = var.http_cidr
  https_cidr = var.https_cidr
  ssh_cidr = var.ssh_cidr
}
# Creating MySQL Cluster for DB
module "mysql_cluster" {
  source = "./mysql_cluster"
  HA = false
  network_id = module.vpc.network_id
  security_group = [module.vpc.security_group]
  hosts = [
    for zone, subnet_id in zipmap(module.vpc.subnet_zone, module.vpc.subnet_id) : {
      zone = zone
      subnet_id = subnet_id
    }
  ]
}
# Creating a DB w/ user, giving creds thru Lockbox
module "mysql_db" {
  source = "./mysql_db"
  depends_on = [module.mysql_cluster]
  cluster_id = module.mysql_cluster.cluster_id
  db_name = "Web_App_DB"
  username = "app"
  password = module.lockbox.db_password
}
# Creating lockbox for putting db's passes into
module "lockbox" {
  source = "./lockbox"
  folder_id = var.folder_id
}
# Creating Container Registry for Docker images
module "container_registry" {
  source = "./container_registry"
  folder_id = var.folder_id
  app_path  = "${path.root}/app"
  service_account = var.sa_name
}
# Creating a vm for web app's container
module "vm" {
  source = "./vm"
  depends_on = [module.mysql_db, module.container_registry]
  vm_web_name       = var.vm_name
  subnet_id     = module.vpc.subnet_id[0]
  vm_nat = var.nat
  vm_sg_ids = [module.vpc.security_group]
  vm_web_image_family   = var.vm_os_family
  vm_web_is_preemptible = var.vm_web_is_preemp
  platform_id = var.platform_id
  service_account_id    = module.container_registry.service_account_id
  vm_resources = {
    cores = var.vm_res.cores
    memory = var.vm_res.memory
    core_fraction = var.vm_res.core_fraction
    size = var.vm_res.size
    type = var.vm_res.type
  }
  vm_label = {
    project = "web-application"
    }
  vm_metadata = {
    registry_id    = module.container_registry.registry_id
    repository_name = module.container_registry.repository_name
    image_tag = var.image_tag
    db_host        = module.mysql_cluster.host_fqdn
    db_port        = var.db_port
    db_user        = module.mysql_db.db_username
    db_password    = module.lockbox.db_password
    db_name        = module.mysql_db.db_name
    db_table_name  = var.db_table_name
    user-data          = templatefile("${path.module}/cloud-init.yml",{
      ssh_public_key = var.vms_ssh_root_key
      registry_id    = module.container_registry.registry_id
      repository_name = module.container_registry.repository_name
      image_tag = var.image_tag
      db_host        = module.mysql_cluster.host_fqdn
      db_port        = var.db_port
      db_user        = module.mysql_db.db_username
      db_password    = module.lockbox.db_password
      db_name        = module.mysql_db.db_name
      db_table_name  = var.db_table_name
      compose_file_content = templatefile("${var.app_path}/compose.yaml",{
        registry_id    = module.container_registry.registry_id
        repository_name = module.container_registry.repository_name
      })
      nginx_config = file("${var.app_path}/nginx/ingress/nginx.conf")
      nginx_default_config = file("${var.app_path}/nginx/ingress/default.conf")
    })
    serial-port-enable = 1
    }
  }
