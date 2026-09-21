variable "cidr" {
  type = string
  default = "1920.1680.0.1"
  description = "ip_address"
  validation {
    condition = can(cidrhost("${var.cidr}/24", 0))
    error_message = "Invalid cidr format"
  }
}
variable "list_of_cidrs" {
  type = list(string)
  default = ["192.168.1.1","1.1.1.1","1270.0.0.1"]
  description = "list of cidrs"
  validation {
    condition = alltrue([
      for cidr in var.list_of_cidrs : can(cidrhost("${cidr}/24",0))
    ])
    error_message = "Invalid cidr format(for list of strings)"
  }
}
