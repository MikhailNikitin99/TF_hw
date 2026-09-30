variable "folder_id" {
  type = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}
variable "secret_name" {
  type        = string
  description = "Name of secret"
  default     = "db-user-password"
}
variable "use_special_pass" {
  type        = bool
  description = "Allow special keys in password"
}
variable "password_length" {
  type        = number
  description = "Password length"
}
