terraform {
  required_version = ">= 1.3.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Create GCS Bucket
resource "google_storage_bucket" "marketing_bucket" {
  name          = "${var.project_id}-marketing-data"
  location      = var.region
  force_destroy = true   # allows deletion even if bucket not empty
  storage_class = "STANDARD"

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true
}

# Optional: Create marketing/raw folder placeholder
# resource "google_storage_bucket_object" "raw_folder" {
#   name   = "marketing/raw/"
#   bucket = google_storage_bucket.marketing_bucket.name
#   content = ""   # creates an empty folder-like object
# }