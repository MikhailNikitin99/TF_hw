terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = ">=0.228.0"
    }
  }
  required_version = ">=1.8.4"
}
resource "yandex_vpc_network" "develop" {
  name = var.env_name
}
#resource "yandex_vpc_subnet" "sub" {
#  count = length(var.cidr_blocks)
#  name = "${yandex_vpc_network.develop.name}-subnet-${count.index+1}"
#  network_id = yandex_vpc_network.develop.id
#  v4_cidr_blocks = tolist([var.cidr_blocks[count.index]])
#  zone = element(var.zone,count.index)
#}
resource "yandex_vpc_security_group" "sg1"{
  name = "Security Group 1"
  description = "Security group for vpc and other modules"
  network_id = yandex_vpc_network.develop.id
}

resource "yandex_vpc_subnet" "sub" {
  for_each = { for s in var.subnets : s.zone => s}
  name = "${yandex_vpc_network.develop.name}-subnet-${each.value.zone}"
  network_id = yandex_vpc_network.develop.id
  v4_cidr_blocks = tolist([each.value.cidr])
  zone = each.value.zone
}
