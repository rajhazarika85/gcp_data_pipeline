variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type        = string
  description = "Region for subnet"
}

variable "vpc_name" {
  type        = string
  default     = "composer-vpc"
}

variable "subnet_name" {
  type        = string
  default     = "composer-subnet"
}

variable "cidr_range" {
  type        = string
  default     = "10.10.0.0/20"
}
