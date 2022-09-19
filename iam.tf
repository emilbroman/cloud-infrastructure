resource "google_service_account" "this" {
  account_id   = "cloud-infrastructure"
  display_name = "Cloud Infrastructure"
}

resource "google_project_iam_member" "cluster_can_write_logs" {
  project = data.google_client_config.current.project
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.this.email}"
}

resource "google_project_iam_member" "cluster_can_write_metrics" {
  project = data.google_client_config.current.project
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.this.email}"
}
