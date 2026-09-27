terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = ">=0.228.0"
    }
  }
  required_version = ">=1.8.4"
}
resource "yandex_container_registry" "fin-neto-registry" {
  name = "fin-terraform-registry"
  folder_id = var.folder_id
  labels = {
    my-label = "web_app"
  }
}
resource "yandex_container_repository" "fin-neto-repository" {
  name = "${yandex_container_registry.fin-neto-registry.id}/webapp-repository"
}
