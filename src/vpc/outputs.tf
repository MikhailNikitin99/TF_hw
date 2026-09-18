output "network_id" {
  value = yandex_vpc_network.develop.id
}
#output "cidr" {
#  value = yandex_vpc_subnet.sub[*].v4_cidr_blocks[0]
#}
#output "zone" {
#  value = yandex_vpc_subnet.sub[*].zone
#}
output "subnet_id" {
  value = [for subnet in yandex_vpc_subnet.sub : subnet.id]
}
output "subnet_zone" {
  value = [for subnet in yandex_vpc_subnet.sub : subnet.zone]
}
output "subnet_cidr" {
  value = [for subnet in yandex_vpc_subnet.sub : subnet.v4_cidr_blocks]
}
