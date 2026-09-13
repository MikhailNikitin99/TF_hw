output "cluster_id" {
  value = yandex_mdb_mysql_database.CreateDB.cluster_id
}
output "db_name" {
  value = yandex_mdb_mysql_database.CreateDB.name
}
output "db_username" {
  value = yandex_mdb_mysql_user.CreateUser.name
}
