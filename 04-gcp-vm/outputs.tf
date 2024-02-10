output "connection_string" {
  value = "ssh -i ${local_file.this.filename} ${local.project_name}@${google_compute_instance.this.network_interface[0].access_config[0].nat_ip}"
}