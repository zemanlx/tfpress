
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
  location       = var.node_locations.0
  version_prefix = var.kubernetes_version_prefix
}

resource "google_container_cluster" "default" {
  name     = "tfpress"
  location = var.node_locations.0
  # node_locations is using same check as deprecated additional zones, which wrong
  # tharefore there is this nasty hack of exluding first node_location
  node_locations     = slice(var.node_locations, 1, length(var.node_locations))
  initial_node_count = 2
  min_master_version = data.google_container_engine_versions.default.latest_master_version
  network            = google_compute_subnetwork.default.name
  subnetwork         = google_compute_subnetwork.default.name

  // Wait for the GCE LB controller to cleanup the resources.
  provisioner "local-exec" {
    when    = "destroy"
    command = "sleep 90"
  }
}
