resource "google_container_cluster" "primary" {
  project  = var.project
  name     = "cka"
  location = var.location

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = ""
    password = ""
    client_certificate_config {
      issue_client_certificate = false
    }
  }
  min_master_version = "1.15.4-gke.22"
  cluster_autoscaling { 
    enabled = false
  }

  node_config {
    oauth_scopes = var.oauth_scopes
    # service_account = "edit-gke-principal@container-expert.iam.gserviceaccount.com"
  }

}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  project    = var.project
  name       = "cka-node-pool"
  location   = var.location
  cluster    = google_container_cluster.primary.name
  node_count = 2

  node_config {
    preemptible  = true
    machine_type = "g1-small"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = var.oauth_scopes
    # service_account = "edit-gke-principal@container-expert.iam.gserviceaccount.com"
  }
}