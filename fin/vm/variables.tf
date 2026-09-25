variable "vm_web_image_family" {
  type = string
  description = "OS image family"
}
variable "vm_web_name" {
  type = string
  description = "VM's name"
}
variable "vm_resources" {
  type = map(object({
    platform_id = string
    cores = number
    memory = number
    core_fraction = number
    size = number
    type = string
  }))
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
  })
  description = "Metafata for vm"
}
