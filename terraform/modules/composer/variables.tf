variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "composer_name" {
  type        = string
  default     = "composer-env"
}

variable "environment_size" {
  type        = string
  default     = "ENVIRONMENT_SIZE_SMALL"
}

variable "image_version" {
  type        = string
  default     = "composer-2.6.5-airflow-2.7.3"
}

# variable "machine_type" {
#   type        = string
#   default     = "n1-standard"
# }

variable "network" {
  type = string
}

variable "subnetwork" {
  type = string
}

variable "service_account" {
  type = string
}

variable "env" {
  type        = string
  default     = "dev"
}
