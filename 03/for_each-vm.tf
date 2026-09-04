resource "yandex_compute_instance" "db" {
  for_each = var.vms_db_resources
  name = each.key
  platform_id = var.vm_platform_id
  resources {
    cores = each.value.cores
    memory = each.value.memory
    core_fraction = each.value.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = each.value.size
      type = each.value.type
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
