output "bucket_name" {
  description = "The name of the created bucket"
  value       = google_storage_bucket.marketing_bucket.name
}

output "bucket_self_link" {
  description = "The URI of the created bucket"
  value       = google_storage_bucket.marketing_bucket.self_link
}

output "bucket_url" {
  description = "The public URL of the bucket"
  value       = "gs://${google_storage_bucket.marketing_bucket.name}"
}
