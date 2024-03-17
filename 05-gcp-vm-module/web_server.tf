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

module "gcp_web_server" {
  source = "./modules/gcp-web-server"

  project_name           = local.project_name
  service_name           = local.service_name
  gcp_zone               = local.gcp.zone
  public_key_openssh     = tls_private_key.this.public_key_openssh
  github_repository_url  = var.github_repository_url
  github_access_key_path = var.github_access_key_path
}
