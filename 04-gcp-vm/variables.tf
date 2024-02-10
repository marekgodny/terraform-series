variable "github_repository_url" {
  type = string
  default = ""
  description = "The URL of the GitHub repository to clone"
}

variable "github_access_key_path" {
  type = string
  default = ""
  description = "The path to the access key file to use for cloning the GitHub repository"
}