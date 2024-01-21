terraform {
  # typically, in production environments, a pessimistic constraint is used "~>" as it allows Terraform to use any version of 1.6.x, but not 1.7.0 or higher.
  # but as we progress new versions of terraform will be released and we don't want to make our code incompatible across blog posts
  required_version = ">= 1.6.6"
}
