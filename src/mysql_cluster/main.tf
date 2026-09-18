terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"
}
resource "yandex_mdb_mysql_cluster" "CreateCluster" {
  name = var.name_db
  environment = var.env_db
  network_id = var.network_id
  version = var.version_db
  resources {
    resource_preset_id = var.preset_id
    disk_type_id = var.disk_type_id
    disk_size = var.disk_size
  }
  dynamic "host" {
    for_each = slice(var.hosts,0,var.HA ? length(var.hosts) : 1)
    content {
      zone = host.value.zone
      subnet_id = host.value.subnet_id
    }
  }
}
