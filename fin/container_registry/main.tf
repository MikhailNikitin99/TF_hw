terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = ">=0.228.0"
    }
    null = {
      source = "hashicorp/null"
      version = ">=3.3.0"
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
resource "null_resource" "build_image" {
  triggers = {
    dockerfile_hash = filemd5("${var.app_path}/Dockerfile")
    main_py_hash    = filemd5("${var.app_path}/main.py")
    requirements_hash = filemd5("${var.app_path}/requirements.txt")
  }
  provisioner "local-exec" {
    command = <<-EOT
      IAM_TOKEN=$(yc iam create-token)
      echo "$IAM_TOKEN" | docker login --username iam --password-stdin cr.yandex
      docker build -t cr.yandex/${yandex_container_registry.fin-neto-registry.id}/web-app:latest ${path.module}/app
      docker push cr.yandex/${yandex_container_registry.fin-neto-registry.id}/web-app:latest
    EOT
  }
  depends_on = [yandex_container_repository.fin-neto-repository]
}
resource "yandex_iam_service_account" "vm_sa" {
  name      = var.service_account
  folder_id = var.folder_id
}
resource "yandex_resourcemanager_folder_iam_member" "vm_sa_puller" {
  folder_id = var.folder_id
  role      = "container-registry.images.puller"
  member    = "serviceAccount:${yandex_iam_service_account.vm_sa.id}"
}
