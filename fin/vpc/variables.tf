variable "env_name" {
  type = string
  default = "web_app_network"
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
variable "ssh_cidr" {
  type = list(string)
  description = "list of cidr for ssh port 22"
}
variable "http_cidr" {
  type = list(string)
  description = "list of cidr for http port 80"
}
variable "https_cidr" {
  type = list(string)
  description = "list of cidr for ssh port 443"
}
