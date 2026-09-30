terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = ">=0.228.0"
    }
    random = {
      source = "hashicorp/random"
      version = ">=3.9.0"
    }
  }
  required_version = ">=1.8.4"
}
resource "random_password" "password" {
  length = var.password_length
  special = var.use_special_pass
}
resource "yandex_lockbox_secret" "db_password" {
  folder_id = var.folder_id
  name = var.secret_name
  description = "Password for MySQL DB user"
}
resource "yandex_lockbox_secret_version" "db_password_version" {
  secret_id = yandex_lockbox_secret.db_password.id
  entries {
    key = "password"
    text_value = random_password.password.result
  }
}
data "yandex_lockbox_secret_version" "db_password_data" {
  secret_id  = yandex_lockbox_secret.db_password.id
  version_id = yandex_lockbox_secret_version.db_password_version.id
}
