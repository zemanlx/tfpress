variable "project_id" {
  description = "The ID of the Google Cloud Platform project."
}

variable "region" {
  description = "The GCP region for Kubernetes deployment."
  default     = "europe-west1"
}

variable "node_locations" {
  description = "The list of zones of GCP region for Kubernetes deployment."
  default     = ["europe-west1-b", "europe-west1-c", "europe-west1-d"]
}

variable "network_name" {
  description = "The GCP network name for Kubernetes deployment."
  default     = "tfpress"
}

variable "kubernetes_version_prefix" {
  description = "The GCP network name for Kubernetes deployment."
  default     = "1.14."
}
