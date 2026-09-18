variable "cluster_id" {
  type = string
  description = "Cluster ID from module.mysql_cluster"
}
variable "db_name" {
  type = string
  description = "Creates a database w/ given name"
}
variable "username" {
  type = string
  description = "Creates a user w/ given name"
}
variable "password" {
  type = string
  description = "Creates a user w/ given name"
}
