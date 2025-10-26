module "storage" {
  source     = "../../modules/storage"
  project_id = var.project_id
  region     = var.region
}

module "bootstrap" {
  source     = "../../modules/bootstrap"
  project_id = var.project_id
}

module "vpc" {
  source      = "../../modules/vpc"
  project_id  = var.project_id
  region      = var.region
  vpc_name    = "dev-composer-vpc"
  subnet_name = "dev-composer-subnet"
  depends_on  = [module.bootstrap]
}

module "iam" {
  source       = "../../modules/iam"
  project_id   = var.project_id
  account_id   = "composer-sa-dev"
  display_name = "Composer Service Account (Dev)"
  depends_on  = [module.bootstrap]
}

module "composer" {
  source          = "../../modules/composer"
  project_id      = var.project_id
  region          = var.region
  composer_name   = "dev-composer"
  network         = module.vpc.network_id
  subnetwork      = module.vpc.subnet_id
  service_account = module.iam.service_account_email
  depends_on      = [module.bootstrap]
}
