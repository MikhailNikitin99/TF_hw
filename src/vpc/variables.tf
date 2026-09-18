variable "env_name" {
  type = string
  default = "develop"
  description = "Network's name"
}
#variable "cidr_blocks" {
#  type = list(string)
#  default = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
#  description = "List of cidr blocks"
#}
#variable "zone" {
#  type = list(string)
#  default = ["ru-central1-a","ru-central1-b","ru-central1-e"]
#}

variable "subnets" {
  type = list(object({
    zone = string
    cidr = string
  }))
  default = [{zone = "ru-central1-a",cidr = "10.0.1.0/24"}]
description = "list of zones and cidrs"
}
