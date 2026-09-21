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
  versioning = true
}
