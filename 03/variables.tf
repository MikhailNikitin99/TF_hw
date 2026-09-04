###cloud vars
#variable "token" {
#  type        = string
#  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
#}

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
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

###VM vars
variable "vm_image_family" {
  type = string
  default = "ubuntu-2004-lts"
  description = "OS image family for VM"
}

variable "vm_platform_id" {
  type = string
  default = "standard-v1"
  description= "VM's platform"
}

variable "vm_is_preemtible" {
  type = bool
  default = true
  description = "Define is VM preemtible or not"
}

variable "vm_web_nat" {
  type = bool
  default = true
  description = "Turn on or off VM's nat"
}

variable "vm_web_serial_port" {
  type = number
  default = 1
  description = "Serial-port status: 1 is on, 0 is off"
}

### VM resources
variable "vms_web_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    size      = number
    type      = string
  }))
  description = "Resources for web and db vms"
}

variable "vms_db_resources" {
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
    ssh-keys = string
  })
  description = "Common metadata for vms"
}
