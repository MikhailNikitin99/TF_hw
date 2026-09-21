variable "lower_case" {
  type = string
  description = "Any string"
  validation {
    condition = var.lower_case == lower(var.lower_case)
    error_message = "String must be lowercase"
  }
}
variable "in_the_end_there_can_be_only_one" {
  description = "Who is better Connor of Duncan?"
  type = object({
    Duncan = optional(bool)
    Connor = optional(bool)
  })
  default = {
    Duncan = true
    Connor = false
  }
  validation {
    error_message = "There can be only one MacLeod"
    condition = var.in_the_end_there_can_be_only_one.Duncan == true && var.in_the_end_there_can_be_only_one.Connor == false ||
    var.in_the_end_there_can_be_only_one.Duncan == false && var.in_the_end_there_can_be_only_one.Connor == true
  }
}
