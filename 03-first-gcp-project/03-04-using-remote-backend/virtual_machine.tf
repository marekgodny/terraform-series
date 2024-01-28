resource "google_compute_instance" "this" {
  name         = "my-first-machine"
  machine_type = "e2-micro"
  zone         = local.gcp.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = "default"
  }
}
