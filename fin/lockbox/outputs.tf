output "secret_id" {
  value       = yandex_lockbox_secret.db_password.id
  description = "Secret's ID"
}
output "db_password" {
  value     = data.yandex_lockbox_secret_version.db_password_data.entries[0].text_value
  sensitive = true
}
