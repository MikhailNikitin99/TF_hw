# terraform {
#   required_providers {
#     yandex = {
#       source = "yandex-cloud/yandex"
#     }
#   }
#   required_version = ">=1.8.4"
# }
# provider "vault" {
#   address = "http://127.0.0.1:8200"
#   skip_tls_verify = true
#   token = "education"
# }
# data "vault_generic_secret" "vault_example" {
#   path = "secret/example"
# }
# resource "vault_kv_secret_v2" "new_secret1337" {
#   mount = "secret"
#   name = "database/config"
#   data_json = jsonencode({
#     username = "Iv@n"
#     password = "SecretnyParol"
#   })
# }
