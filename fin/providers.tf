terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = ">=0.228.0"
    }
  }
  required_version = ">1.12.0"
  backend "s3" {
    bucket = "neto-s3"
    key = "terraform.tfstate"
    region = "ru-central1"
    use_lockfile = true
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    skip_region_validation = true
    skip_credentials_validation = true
    skip_requesting_account_id = true
    skip_s3_checksum = true
  }
}
provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  service_account_key_file = file("~/.authorized_key.json")
  zone      = var.default_zone
}
provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  skip_region_validation = true
  skip_credentials_validation = true
  skip_requesting_account_id = true
}
