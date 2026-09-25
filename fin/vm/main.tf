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
  platform_id = var.vm_resources.platform_id
  resources {
    cores = var.vm_resources.web.cores
    memory = var.vm_resources.web.memory
    core_fraction = var.vm_resources.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size  = var.vm_resources.web.size
      type = var.vms_resources.web.type
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_is_preemptible
  }
  network_interface {
    subnet_id = var.subnet_id
    security_groups_ids = var.vm_sg_ids
  }
  labels {
    project = var.label
  }
  metadata = var.vm_metadata
}
