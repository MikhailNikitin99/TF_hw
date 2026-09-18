terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"
}
resource "yandex_mdb_mysql_database" "CreateDB" {
  cluster_id = var.cluster_id
  name = var.db_name
}
resource "yandex_mdb_mysql_user" "CreateUser" {
  depends_on = [yandex_mdb_mysql_database.CreateDB]
  cluster_id = var.cluster_id
  name = var.username
  password = var.password
}
