resource "google_container_cluster" "this" {
  name = "emilbroman"

  remove_default_node_pool = true
  initial_node_count       = 1

  logging_config {
    enable_components = []
  }

  workload_identity_config {
    workload_pool = "${data.google_client_config.current.project}.svc.id.goog"
  }
}

resource "google_container_node_pool" "this" {
  name    = "cluster-nodes"
  cluster = google_container_cluster.this.name

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    service_account = google_service_account.this.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    workload_metadata_config {
      mode = "GKE_METADATA"
    }
  }
}
