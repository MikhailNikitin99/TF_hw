terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = ">=0.228.0"
    }
  }
  required_version = ">=1.8.4"
}
resource "yandex_lockbox_secret" "DBPass" {
  folder_id = var.folder_id
  name = "UserPass"
  description = "Password for MySQL DB"
  password_payload_specification {
    password_key = "DBUserPasscode"
    length = 13
  }
}
data "yandex_lockbox_secret_version" "DBPass_entry" {
  secret_id = yandex_lockbox_secret.DBPass.secret_id
}
