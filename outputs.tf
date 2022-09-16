output "cluster_url" {
  value = "https://${google_container_cluster.this.endpoint}"
}

output "cluster_ca_certificate" {
  value = google_container_cluster.this.master_auth[0].cluster_ca_certificate
}

output "cluster_service_account" {
  value = google_service_account.this.email
}

output "domain" {
  value = trimsuffix(google_dns_managed_zone.this.dns_name, ".")
}

output "dns_zone_name" {
  value = google_dns_managed_zone.this.name
}
