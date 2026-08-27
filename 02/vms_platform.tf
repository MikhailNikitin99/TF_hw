variable "vm_db_image_family" {
  type = string
  default = "ubuntu-2004-lts"
  description = "OS image family for VM"
}

#variable "vm_db_name" {
#  type = string
#  default = local.vm_db_name
#  description = "VM's name"
#}

variable "vm_db_platform_id" {
  type = string
  default = "standard-v1"
  description= "VM's platform"
}

#variable "vm_db_cores" {
#  type = number
#  default = 2
#  description = "Cores quantity"
#}

#variable "vm_db_memory" {
#  type = number
#  default = 2
#  description = "RAM quantity"
#}

#variable "vm_db_core_fraction" {
#  type = number
#  default = 20
#  description = "Percenage of core fraction(5,20,50,100)"
#}

variable "vm_db_is_preemtible" {
  type = bool
  default = true
  description = "Define is VM preemtible or not"
}

variable "vm_db_nat" {
  type = bool
  default = true
  description = "Turn on or off VM's nat"
}

#variable "vm_db_serial_port" {
#  type = number
#  default = 1
#  description = "Serial-port status: 1 is on, 0 is off"
#}