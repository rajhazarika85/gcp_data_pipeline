# Create GCS Bucket
resource "google_storage_bucket" "marketing_bucket" {
  name          = "${var.project_id}-marketing-data"
  project       = var.project_id 
  location      = var.region
  force_destroy = true   # allows deletion even if bucket not empty
  storage_class = "STANDARD"
  # Other options: "NEARLINE", "COLDLINE", "ARCHIVE" (cheaper but slower).

  versioning {
    enabled = false
  }

  uniform_bucket_level_access = true
}

# Optional: Create marketing/raw folder placeholder
resource "google_storage_bucket_object" "raw_folder" {
  name   = "marketing/raw/"
  bucket = google_storage_bucket.marketing_bucket.name
  content = " "   # creates an empty folder-like object
}

# Staging folder
# resource "google_storage_bucket_object" "staging_folder" {
#   name   = "marketing/staging/"
#   bucket = google_storage_bucket.marketing_bucket.name
#   content = ""
# }

# Processed data folder
# resource "google_storage_bucket_object" "processed_folder" {
#   name   = "marketing/processed/"
#   bucket = google_storage_bucket.marketing_bucket.name
#   content = ""
# }