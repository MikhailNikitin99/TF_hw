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
  validation {
    condition = contains(["ru-central1-a","ru-central1-b","ru-central1-d","ru-central1-e","ru-central1-m"],var.default_zone)
    error_message = "Invalid availability zone provided"
  }
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
###common vars
variable "aws_region" {
  type = string
}
variable "aws_access_key" {
  type = string
}
variable "aws_secret_key" {
  type = string
}
variable "vms_ssh_root_key" {
  type        = string
  default     = "your_ssh_ed25519_key"
  description = "ssh-keygen -t ed25519"
}
variable "MySQL_User_Password" {
  type = string
  description = "Password for db's user"
}
# vars for vm configuration
variable "vm_os_family" {
  type = string
  description = "OS image family"
}
variable "vm_name" {
  type = string
  description = "VM's name"
}
variable "platform_id" {
  type = string
  description = "platform_id"
}
variable "vm_res" {
  type = object({
    cores = number
    memory = number
    core_fraction = number
    size = number
    type = string
  })
  description = "Resources for VM"
}
variable "vm_web_is_preemp" {
  type = bool
  default = true
  description = "Is VM stoppable or not?"
}
