provider "google" {
  region  = var.region
  project = var.project_id
  version = "~> 2.17"
}

data "google_client_config" "current" {}

provider "helm" {
  version        = "~> 0.10"
  install_tiller = true

  kubernetes {
    host                   = google_container_cluster.default.endpoint
    token                  = data.google_client_config.current.access_token
    client_certificate     = base64decode(google_container_cluster.default.master_auth.0.client_certificate)
    client_key             = base64decode(google_container_cluster.default.master_auth.0.client_key)
    cluster_ca_certificate = base64decode(google_container_cluster.default.master_auth.0.cluster_ca_certificate)
  }
}
