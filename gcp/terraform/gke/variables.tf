variable "project" {
  description = "GCP Project."
  default     = "container-expert"
}

variable "region" {
  description = "GCP Region."
  default     = "us-central1"
}

variable "location" {
  description = "GCP location."
  default     = "us-central1-a"
}

variable "oauth_scopes" {
  description = "oauth_scopes."
  default     = [
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/service.management.readonly",
    "https://www.googleapis.com/auth/servicecontrol",
    "https://www.googleapis.com/auth/trace.append"
  ]
}


variable "az_count" {
  default     = "2"
}