provider "google" {
  project = local.gcp.project
  region  = local.gcp.region
  user_project_override = true  # required by the Billing Budget
  billing_project = local.gcp.project  # required by the Billing Budget
}

terraform {
  required_version = ">= 1.6.6"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.13.0"  # version comes from https://registry.terraform.io/providers/hashicorp/google/latest/docs
    }
  }
}
