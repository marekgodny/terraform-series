output "connection_string" {
  value = "ssh -i ${local_file.this.filename} ${local.project_name}@${module.gcp_web_server.nat_ip}"
}
