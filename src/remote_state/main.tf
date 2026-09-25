terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = ">=0.228.0"
    }
  }
  required_version = ">=1.8.4"
}
resource "yandex_storage_bucket" "test_s3" {
  bucket = "s3-neto-bucket"
  max_size = 1073741824
  versioning {
    enabled = true
  }
}
resource "yandex_iam_service_account" "s3" {
  name = "s3-service-account"
  description = "A service account for yandex s3 bucket"
  }
resource "yandex_iam_service_account_iam_member" "editor_role" {
  depends_on = [yandex_iam_service_account.s3]
  service_account_id = yandex_iam_service_account.s3.id
  role = "storage.editor"
  member = "serviceAccount:${yandex_iam_service_account.s3.id}"
}
resource "yandex_iam_service_account_static_access_key" "s3_static_key" {
  depends_on = [yandex_iam_service_account.s3]
  service_account_id = yandex_iam_service_account.s3.id
  description = "Static keys for service account"
}
