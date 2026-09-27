variable "folder_id" {
  type = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}
variable "secret_name" {
  type        = string
  description = "Name of secret"
  default     = "db-user-password"
}
variable "password_key" {
  type        = string
  description = "Password Key"
  default     = "db_password"
}
variable "password_length" {
  type        = number
  description = "Password length"
  default     = 13
}
