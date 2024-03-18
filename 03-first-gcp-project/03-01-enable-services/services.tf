locals {
  services = [
    "iam.googleapis.com",  # to manage users and permissions
    "compute.googleapis.com", # to create Virtual Machines
    "storage.googleapis.com",  # to store files, including Terraform state files
    "cloudbilling.googleapis.com",  # to manage billing accounts
    "billingbudgets.googleapis.com",  # to manage billing budgets
    "container.googleapis.com",  # to create Kubernetes clusters
  ]
}

resource "google_project_service" "this" {
  for_each = toset(local.services)

  service = each.key
}
