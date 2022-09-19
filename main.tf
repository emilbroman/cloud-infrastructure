terraform {
  backend "gcs" {
    bucket = "emilbroman-terraform-state"
    prefix = "cloud-infrastructure"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">=4.36.0"
    }
  }
}

provider "google" {
  project = "emilbroman"
  region  = "europe-north1"
  zone    = "europe-north1-a"
}

data "google_client_config" "current" {}
