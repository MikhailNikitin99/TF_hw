terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = ">=0.228.0"
    }
  }
  required_version = ">=1.8.4"
}
data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_family
}
resource "yandex_compute_instance" "web" {
  name = var.vm_web_name
  platform_id = var.platform_id
  service_account_id = var.service_account_id
  resources {
    cores = var.vm_resources.cores
    memory = var.vm_resources.memory
    core_fraction = var.vm_resources.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size  = var.vm_resources.size
      type = var.vm_resources.type
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_is_preemptible
  }
  network_interface {
    subnet_id = var.subnet_id
    security_group_ids = var.vm_sg_ids
    nat = var.vm_nat
  }
  labels = var.vm_label
  metadata = var.vm_metadata
}
