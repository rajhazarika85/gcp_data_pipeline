resource "google_composer_environment" "composer_env" {
  name   = var.composer_name
  region = var.region
  project = var.project_id

  config {
    environment_size = var.environment_size

    software_config {
      image_version = var.image_version

      pypi_packages = {
        "pandas"   = ""
        "requests" = ""
      }
    }

    node_config {
      # machine_type     = var.machine_type
      network          = var.network
      subnetwork       = var.subnetwork
      service_account  = var.service_account
    }

    workloads_config {
      scheduler {
        cpu        = 1
        memory_gb  = 2
        storage_gb = 1
      }
      web_server {
        cpu        = 1
        memory_gb  = 2
        storage_gb = 1
      }
      worker {
        cpu        = 1
        memory_gb  = 3
        storage_gb = 2
      }
    }
  }

  labels = {
    environment = var.env
  }
}
