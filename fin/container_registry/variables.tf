variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}
variable "app_path" {
  type        = string
  default     = "../app"
  description = "Path to app"
}
variable "service_account" {
  type        = string
  description = "Service Account Name"
}
