data "google_project" "current" {
  project_id = var.project_id
}

resource "google_project_iam_member" "composer_sa_ext_role" {
  project = var.project_id
  role    = "roles/composer.ServiceAgentV2Ext"
  member  = "serviceAccount:service-${data.google_project.current.number}@cloudcomposer-accounts.iam.gserviceaccount.com"
}


resource "google_project_service" "enabled_apis" {
  for_each = toset([
    "compute.googleapis.com",
    "composer.googleapis.com",
    "container.googleapis.com",
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "serviceusage.googleapis.com"
  ])
  project = var.project_id
  service = each.value
}
