variable "env_name" {
  type = string
  default = "Web app's network"
  description = "Network's name"
}
variable "subnets" {
  type = list(object({
    zone = string
    cidr = string
  }))
  default = [{zone = "ru-central1-a",cidr = "10.0.1.0/24"}]
description = "list of zones and cidrs"
}
