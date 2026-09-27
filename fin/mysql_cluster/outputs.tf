output "cluster_id" {
  value = yandex_mdb_mysql_cluster.CreateCluster.id
}
output "network_id" {
  value = yandex_mdb_mysql_cluster.CreateCluster.network_id
}
output "host_fqdn" {
  value = yandex_mdb_mysql_cluster.CreateCluster.host[0].fqdn
}
