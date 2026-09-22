output "s3_name" {
  value = yandex_storage_bucket.test_s3.bucket
}
output "access_key" {
  value = yandex_iam_service_account_static_access_key.s3_static_key.access_key
}
output "secret_key" {
  value = yandex_iam_service_account_static_access_key.s3_static_key.secret_key
  sensitive = true
}
output "backend_configuration" {
  value = templatefile("${path.module}/backend.tftpl",{
    bucket_name = yandex_storage_bucket.test_s3.bucket
    access_key = yandex_iam_service_account_static_access_key.s3_static_key.access_key
  })
}
