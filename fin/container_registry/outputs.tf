output "registry_id" {
  value = yandex_container_registry.fin-neto-registry.id
}
output "service_account_id" {
  value      = yandex_iam_service_account.vm_sa
}
