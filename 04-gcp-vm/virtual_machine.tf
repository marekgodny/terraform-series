locals {
  project_name = "terraform-series"
  service_name = "http-server"
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "this" {
  filename        = "${local.project_name}.pem"
  content         = tls_private_key.this.private_key_pem
  file_permission = "400"
}

data "local_sensitive_file" "this" {
  count = var.github_access_key_path != "" ? 1 : 0

  filename = var.github_access_key_path
}

resource "google_compute_instance" "this" {
  name         = "${local.project_name}-${local.service_name}"
  machine_type = "e2-micro"
  zone         = local.gcp.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    ssh-keys = "${local.project_name}:${tls_private_key.this.public_key_openssh}"
  }

  service_account {
    scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  metadata_startup_script = templatefile(
    "${path.module}/templates/startup_script.tftpl",
    {
      install_packages = "vim curl wget git tmux nginx"
      install_docker = "false"  # anything other than "true" will be considered as "false"
      github_repository_url = var.github_repository_url
      github_ssh_key        = var.github_access_key_path != "" ? data.local_sensitive_file.this[0].content : ""
    }
  )

  tags = [local.project_name]
}

resource "google_compute_firewall" "this" {
  name    = "${local.project_name}-${local.service_name}"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["22", "80"]  # SSH & HTTP
  }
  target_tags   = [local.project_name]
  source_ranges = ["0.0.0.0/0"]
}
