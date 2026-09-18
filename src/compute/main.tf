
module "vpc" {
  source = "../vpc"
  env_name = "devdevdev"
  subnets = [
    {zone = "ru-central1-a",cidr = "10.0.1.0/24"},
    # {zone = "ru-central1-b",cidr = "10.0.2.0/24"},
    # {zone = "ru-central1-e",cidr = "10.0.3.0/24"}
  ]
}
#module "vault" {}
# module "mysql_cluster" {
#   source = "../mysql_cluster"
#   HA = true
#   network_id = module.vpc.network_id
#   hosts = [
#     for zone, subnet_id in zipmap(module.vpc.subnet_zone, module.vpc.subnet_id) : {
#       zone = zone
#       subnet_id = subnet_id
#     }
#   ]
# }
# module "mysql_db" {
#   source = "../mysql_db"
#   depends_on = [module.mysql_cluster]
#   cluster_id = module.mysql_cluster.cluster_id
#   db_name = "test"
#   username = "app"
#   password = var.MySQL_User_Password
# }
resource "yandex_vpc_network" "develop" {
 name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
 name           = var.vpc_name
 zone           = var.default_zone
 network_id     = yandex_vpc_network.develop.id
 v4_cidr_blocks = var.default_cidr
}

# module "test-vm" {
#  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
#  env_name       = "develop"
#  network_id     = module.vpc.network_id
#  subnet_zones   = module.vpc.subnet_zone
#  subnet_ids     = module.vpc.subnet_id
#  instance_name  = "webs"
#  instance_count = 2
#  image_family   = "ubuntu-2004-lts"
#  public_ip      = true

#  labels = {
#    project = "marketing"
#     }

#  metadata = {
#    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
#    serial-port-enable = 1
#  }
# }

# module "example-vm" {
#   source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
#   env_name       = "stage"
#   network_id     = module.vpc.network_id
#   subnet_zones   = module.vpc.subnet_zone
#   subnet_ids     = module.vpc.subnet_id
#   instance_name  = "web-stage"
#   instance_count = 1
#   image_family   = "ubuntu-2004-lts"
#   public_ip      = true

#   labels = {
#     project = "analytics"
#      }

#   metadata = {
#     user-data          = data.template_file.cloudinit.rendered
#     serial-port-enable = 1
#   }
# }

# data "template_file" "cloudinit" {
#   template = file("./cloud-init.yml")
#   vars = {
#       ssh_public_key = var.vms_ssh_root_key
#   }
# }
