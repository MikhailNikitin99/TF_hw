variable "HA" {
  type = bool
  default = false
  description = "High availability: true = 2 host, false = 1"
}
variable "name_db" {
  type = string
  default = "example"
  description = "Cluster's name"
}
variable "env_db" {
  type = string
  default = "PRESTABLE"
  description = "Deployment environment of the MySQL cluster"
}
variable "network_id" {
  type = string
  description = "Id to attach a cluster to"
}
variable "version_db" {
  type = string
  default = "5.7"
  description = "Version of MySQL cluster(5.7, 8.0, 8.4)"
}
variable "preset_id" {
  type = string
  default = "b2.medium"
  description = "ID of the preset for comp. resources available"
}
variable "disk_type_id" {
  type = string
  default = "network-hdd"
  description = "Storage's type of MySQL hosts"
}
variable "disk_size" {
  type = number
  default = 10
  description = "Volume of storage"
}
variable "hosts" {
  type = list(object({
    zone = string
    subnet_id = string
    }))
  description = "availability zone + subnet id list"
}
#variable "zones" {
#  type = list(string)
#  description = "availability zones"
#}
#variable "subnet_ids" {
#  type = list(string)
#  description = "Subnet IDs"
#}
variable "disk_size_limit" {
  type = number
  default = 10
  description = "Limiting the size of a disk"
}
