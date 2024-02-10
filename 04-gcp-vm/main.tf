provider "google" {
  project = local.gcp.project_id
  region  = local.gcp.region
}

terraform {
  required_version = ">= 1.6.6"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.13.0"  # version comes from https://registry.terraform.io/providers/hashicorp/google/latest/docs
    }
  }
  backend "gcs" {
    bucket  = "terraform-series-tfstate-9abab632ccbc8053"
    prefix  = "terraform-vm/state"
  }
}
