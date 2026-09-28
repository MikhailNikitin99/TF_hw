output "registry_id" {
  value = yandex_container_registry.fin-neto-registry.id
}
output "service_account_id" {
  value      = data.yandex_iam_service_account.vm_sa.id
}
output "repository_name" {
  value = yandex_container_repository.fin-neto-repository.name
}
