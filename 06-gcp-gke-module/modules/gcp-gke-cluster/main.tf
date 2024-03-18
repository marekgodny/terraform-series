resource "google_container_cluster" "this" {
  name     = "${var.project_id}-gke"
  location = "${var.region}-a"

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.vpc_name
  subnetwork = var.subnet_name
}

resource "google_container_node_pool" "this" {
  name       = "${google_container_cluster.this.name}-${var.machine_type}"
  location   = "${var.region}-a"
  cluster    = google_container_cluster.this.name
  node_count = 1

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.environment
    }

    preemptible     = true
    machine_type    = var.machine_type
    service_account = google_service_account.this.email
    tags            = ["gke-node", "${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }

  autoscaling {
    min_node_count = var.autoscaling.min_node_count
    max_node_count = var.autoscaling.max_node_count
  }

  management {
    auto_repair  = false
    auto_upgrade = true
  }
}

resource "google_service_account" "this" {
  account_id   = var.machine_type
  display_name = var.machine_type
}


resource "google_compute_firewall" "this" {
  name    = google_container_cluster.this.name
  network = var.vpc_name

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "8888", "30000-32767"]
  }

  source_ranges = ["0.0.0.0/0"]

  source_service_accounts = [google_service_account.this.email]
}
