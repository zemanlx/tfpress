
resource "google_compute_network" "default" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "default" {
  name                     = var.network_name
  ip_cidr_range            = "10.127.0.0/20"
  network                  = google_compute_network.default.self_link
  region                   = var.region
  private_ip_google_access = true
}

data "google_container_engine_versions" "default" {
  location       = var.zone
  version_prefix = var.kubernetes_version_prefix
}

resource "google_container_cluster" "default" {
  name               = "tfpress"
  location           = var.zone
  initial_node_count = 3
  min_master_version = data.google_container_engine_versions.default.latest_master_version
  network            = google_compute_subnetwork.default.name
  subnetwork         = google_compute_subnetwork.default.name

  // Wait for the GCE LB controller to cleanup the resources.
  provisioner "local-exec" {
    when    = "destroy"
    command = "sleep 90"
  }
}
