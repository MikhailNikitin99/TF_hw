variable "vm_web_image_family" {
  type = string
  description = "OS image family"
}
variable "vm_web_name" {
  type = string
  description = "VM's name"
}
variable "platform_id" {
  type = string
  description = "platform_id"
}
variable "vm_resources" {
  type = object({
    cores = number
    memory = number
    core_fraction = number
    size = number
    type = string
  })
  description = "Resources for VM"
}
variable "vm_web_is_preemptible" {
  type = bool
  default = true
  description = "Is VM stoppable or not?"
}
variable "subnet_id" {
  type = string
  description = "Subnet ID for VM"
}
variable "vm_sg_ids" {
  type = set(string)
  description = "Set of Security Groups for VM"
}
variable "vm_label" {
  type = object({
    project = string
  })
  description = "Label for VM"
}
variable "vm_metadata" {
  type = object({
    user-data = string
    serial-port-enable = number
    registry_id    = string
    repository_name = string
    image_tag = string
    db_host        = string
    # db_port        = number
    db_user        = string
    db_password    = string
    db_name        = string
    # db_table_name  = string
  })
  description = "Metafata for vm"
}
variable "service_account_id" {
  type = string
  description = "Service Account Id"
}
variable vm_nat {
  type = bool
  default = false
  description = "VM's NAT"
}
