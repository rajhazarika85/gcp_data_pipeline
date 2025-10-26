variable "project_id" {
  type = string
}

variable "account_id" {
  type        = string
  description = "Service account ID (without domain)"
}

variable "display_name" {
  type        = string
  default     = "Terraform Managed Service Account"
}

variable "roles" {
  type        = list(string)
  description = "List of IAM roles to attach"
  default     = [
    "roles/composer.worker",
    "roles/storage.admin",
    "roles/bigquery.admin"
  ]
}
