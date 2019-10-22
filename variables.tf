variable "project_id" {
  description = "The ID of the Google Cloud Platform project."
}

variable "region" {
  description = "The GCP region for Kubernetes deployment."
  default     = "europe-west1"
}

variable "zone" {
  description = "The zone of GCP region for Kubernetes deployment."
  default     = "europe-west1-b"
}

variable "network_name" {
  description = "The GCP network name for Kubernetes deployment."
  default     = "tfpress"
}
