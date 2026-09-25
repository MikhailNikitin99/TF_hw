
# Creating network, subnets and security group
module "vpc" {
  source = "./vpc"
  env_name = "Web App Net"
  subnets = [
    {zone = "ru-central1-a",cidr = "10.0.1.0/24"}
  ]
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
  db_name = "Web App DB"
  username = "app"
  password = var.MySQL_User_Password
}
# Creating a vm for web app's container
module "vm" {
  source = "./vm"
  depends_on = [module.mysql_db]
  vm_web_name       = var.vm_name
  subnet_id     = module.vpc.subnet_id
  vm_sg_ids = [module.vpc.security_group]
  vm_web_image_family   = var.vm_os_family
  vm_web_is_preemptible = var.vm_web_is_preemp
  vm_resources = {
    platform_id = var.vm_res.platform_id
    cores = var.vm_res.cores
    memory = var.vm_res.memory
    core_fraction = var.vm_res.core_fraction
    size = var.vm_res.size
    type = var.vm_res.type
  }
  vm_label = {
    project = "Web Application"
    }
  vm_metadata = {
    user-data          = templatefile("${path.module}/cloud-init.yml",{
      ssh_public_key = var.vms_ssh_root_key
    })
    serial-port-enable = 1
    }
  }
