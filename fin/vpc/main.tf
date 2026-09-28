terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = ">=0.228.0"
    }
  }
  required_version = ">=1.8.4"
}
resource "yandex_vpc_network" "web_app_network" {
  name = var.env_name
}
resource "yandex_vpc_security_group" "sg1"{
  name = "Security_Group_1"
  description = "Security group for vpc and other modules"
  network_id = yandex_vpc_network.web_app_network.id
  ingress {
    protocol       = "TCP"
    description    = "SSH"
    v4_cidr_blocks = var.ssh_cidr
    port           = 22
  }
  ingress {
    protocol       = "TCP"
    description    = "HTTP"
    v4_cidr_blocks = var.http_cidr
    port           = 80
  }
  ingress {
    protocol       = "TCP"
    description    = "HTTPS"
    v4_cidr_blocks = var.https_cidr
    port           = 443
  }
  egress {
    protocol       = "ANY"
    description    = "Allow all outbound"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "yandex_vpc_security_group" "mysql_sg" {
  name        = "mysql-sg"
  description = "Security group for MySQL cluster"
  network_id  = yandex_vpc_network.web_app_network.id # ID вашей сети
  ingress {
    description    = "Allow MySQL from VM"
    protocol       = "TCP"
    port           = 3306
    security_group_id = yandex_vpc_security_group.sg1.id
  }
  egress {
    description    = "Allow all outbound"
    protocol       = "ANY"
    from_port      = 0
    to_port        = 65535
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "yandex_vpc_subnet" "sub" {
  for_each = { for s in var.subnets : s.zone => s}
  name = "${yandex_vpc_network.web_app_network.name}-subnet-${each.value.zone}"
  network_id = yandex_vpc_network.web_app_network.id
  v4_cidr_blocks = tolist([each.value.cidr])
  zone = each.value.zone
}
