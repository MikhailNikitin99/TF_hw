
module "vpc" {
  source = "../vpc"
  env_name = "devdevdev"
  subnets = [
    {zone = "ru-central1-a",cidr = "10.0.1.0/24"},
    {zone = "ru-central1-b",cidr = "10.0.2.0/24"},
    {zone = "ru-central1-e",cidr = "10.0.3.0/24"}
  ]
}
#module "vault" {}
module "mysql_cluster" {
  source = "../mysql_cluster"
  HA = true
  network_id = module.vpc.network_id
  security_group = tolist(module.vpc.security_group)
  hosts = [
    for zone, subnet_id in zipmap(module.vpc.subnet_zone, module.vpc.subnet_id) : {
      zone = zone
      subnet_id = subnet_id
    }
  ]
}
module "mysql_db" {
  source = "../mysql_db"
  depends_on = [module.mysql_cluster]
  cluster_id = module.mysql_cluster.cluster_id
  db_name = "test"
  username = "app"
  password = var.MySQL_User_Password
}
resource "yandex_vpc_network" "develop" {
 name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
 name           = var.vpc_name
 zone           = var.default_zone
 network_id     = yandex_vpc_network.develop.id
 v4_cidr_blocks = var.default_cidr
}

module "test-vm" {
 source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=9072958b84f7898863275a07bcdc76eb2725cb03"
 env_name       = "develop"
 network_id     = module.vpc.network_id
 subnet_zones   = module.vpc.subnet_zone
 subnet_ids     = module.vpc.subnet_id
 security_group_ids = tolist(module.vpc.security_group)
 instance_name  = "webs"
 instance_count = 2
 image_family   = "ubuntu-2004-lts"
 public_ip      = false

 labels = {
   project = "marketing"
  }
 metadata = {
  user-data          = templatefile("${path.module}/cloud-init.yml",{
    ssh_public_key = var.vms_ssh_root_key
  })
  serial-port-enable = 1
  }
}

module "example-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=9072958b84f7898863275a07bcdc76eb2725cb03"
  env_name       = "stage"
  network_id     = module.vpc.network_id
  subnet_zones   = module.vpc.subnet_zone
  subnet_ids     = module.vpc.subnet_id
  security_group_ids = tolist(module.vpc.security_group)
  instance_name  = "web-stage"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = false

  labels = {
    project = "analytics"
     }

  metadata = {
    user-data          = templatefile("${path.module}/cloud-init.yml",{
      ssh_public_key = var.vms_ssh_root_key
    })
    serial-port-enable = 1
  }
}
