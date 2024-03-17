data "local_sensitive_file" "this" {
  count = var.github_access_key_path != "" ? 1 : 0

  filename = var.github_access_key_path
}

resource "google_compute_instance" "this" {
  name         = "${var.project_name}-${var.service_name}"
  machine_type = "e2-micro"
  zone         = var.gcp_zone

  boot_disk {
    initialize_params {
      image = "debian-12-bookworm-v20240110"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    ssh-keys = "${var.project_name}:${var.public_key_openssh}"
  }

  metadata_startup_script = templatefile(
    "${path.module}/templates/startup_script.tftpl",
    {
      install_packages      = "vim curl wget git tmux nginx"
      install_docker        = "false" # anything other than "true" will be considered as "false"
      github_repository_url = var.github_repository_url
      github_ssh_key        = var.github_access_key_path != "" ? data.local_sensitive_file.this[0].content : ""
    }
  )

  tags = [var.project_name]
}

resource "google_compute_firewall" "this" {
  name    = "${var.project_name}-${var.service_name}"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["22", "80"] # SSH & HTTP
  }
  target_tags   = [var.project_name]
  source_ranges = ["0.0.0.0/0"]
}
