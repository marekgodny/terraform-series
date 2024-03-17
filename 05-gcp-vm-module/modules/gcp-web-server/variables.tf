variable "project_name" {
  type        = string
  description = "The name of the project used for naming resources (prefix) and accessing the web server"
}

variable "service_name" {
  type        = string
  description = "The name of the service used for naming resources (suffix)"
}

variable "gcp_zone" {
  type        = string
  description = "The GCP zone to deploy the web server to"
}

variable "public_key_openssh" {
  type        = string
  description = "The public key in OpenSSH format to use for SSH access"
}

variable "github_repository_url" {
  type        = string
  default     = ""
  description = "The URL of the GitHub repository to clone"
}

variable "github_access_key_path" {
  type        = string
  default     = ""
  description = "The path to the access key file to use for cloning the GitHub repository"
}
