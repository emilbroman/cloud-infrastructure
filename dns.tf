resource "google_dns_managed_zone" "this" {
  name     = "zone"
  dns_name = "emilbroman.me."
}
