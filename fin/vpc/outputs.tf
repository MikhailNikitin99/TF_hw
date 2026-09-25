output "network_id" {
  value = yandex_vpc_network.web_app_network.id
}
output "subnet_id" {
  value = [for subnet in yandex_vpc_subnet.sub : subnet.id]
}
output "subnet_zone" {
  value = [for subnet in yandex_vpc_subnet.sub : subnet.zone]
}
output "subnet_cidr" {
  value = [for subnet in yandex_vpc_subnet.sub : subnet.v4_cidr_blocks]
}
output "security_group" {
  value = yandex_vpc_security_group.sg1.id
}
