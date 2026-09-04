data "yandex_compute_image" "ubuntu" {
  family = var.vm_image_family
}

resource "yandex_compute_instance" "web" {
  depends_on = [yandex_compute_instance.db]
  count = 2
  name = "web-${count.index+1}"
  platform_id = var.vm_platform_id
  resources {
    cores = var.vms_web_resources.web.cores
    memory = var.vms_web_resources.web.memory
    core_fraction = var.vms_web_resources.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = var.vms_web_resources.web.size
      type = var.vms_web_resources.web.type
    }
  }
  scheduling_policy {
    preemptible = var.vm_is_preemtible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_nat
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = var.vms_metadata
}
