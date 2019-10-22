provider "google" {
  region  = var.region
  project = var.project_id
  version = "~> 2.17"
}

data "google_client_config" "current" {}
