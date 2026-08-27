###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_db_default_zone" {
  type = string
  default = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "web_default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "db_default_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

###var for locals

variable "company_name"{
  type = string
  default = "netology"
  description = "company's name"
}

variable "web_server_name" {
  type = string
  default = "web"
  description = "For web's server name"
}

variable "db_server_name" {
  type = string
  default = "db"
  description = "For db's server name"
}

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFWNTWN5zhNbXBHenFOnTWjkdMaoDYqjmAz8d4R/WxephdJKPd0/ztEaHQWtYRSYhepET/tBPj/quKHmTMHOHi9mJhpT54XA7sPL8sYNVe7sXU0CgP2UNBQBxiQnIBab0dMPaddxtFPfeY7+8KIEfMuY0C04MDULNL27wyuFN6hzH/2yrYcZEYLrZC1NlGbwswZiqUjZJc3WGOPefq4B+iHf754Y8IHE0G2LDAoz9pff7VrgtoE+NJHU1n8mfNAfyViwegpdkQGFy2jQPvm9BvBhZLN13us/b5TaYXfW9GrAK1wIQtacIB0c6QEd5sBHFsh139bFdpImIDACzLzLdh"
  description = "ssh-keygen -t ed25519"
}

###VM vars

variable "vm_web_image_family" {
  type = string
  default = "ubuntu-2004-lts"
  description = "OS image family for VM"
}

#variable "vm_web_name" {
#  type = string
#  default = local.vm_web_name
#  description = "VM's name"
#}

variable "vm_web_platform_id" {
  type = string
  default = "standard-v1"
  description= "VM's platform"
}

#variable "vm_web_cores" {
#  type = number
#  default = 2
#  description = "Cores quantity"
#}

#variable "vm_web_memory" {
#  type = number
#  default = 1
#  description = "RAM quantity"
#}

#variable "vm_web_core_fraction" {
#  type = number
#  default = 5
#  description = "Percenage of core fraction(5,20,50,100)"
#}

variable "vm_web_is_preemtible" {
  type = bool
  default = true
  description = "Define is VM preemtible or not"
}

variable "vm_web_nat" {
  type = bool
  default = false
  description = "Turn on or off VM's nat"
}

#variable "vm_web_serial_port" {
#  type = number
#  default = 1
#  description = "Serial-port status: 1 is on, 0 is off"
#}

### VM resources

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    size      = number
    type      = string
  }))
  description = "Resources for web and db vms"
}

variable "vms_metadata" {
  type = object({
    serial-port-enable = number
    ssh-keys             = string
  })
  description = "Common metadata for vms"
}

###8 task

#variable "test" {
#   type = list(map(list(string)))
#}