<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.6 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 5.13.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 5.13.0 |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_instance.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [local_sensitive_file.this](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/sensitive_file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | The GCP zone to deploy the web server to | `string` | n/a | yes |
| <a name="input_github_access_key_path"></a> [github\_access\_key\_path](#input\_github\_access\_key\_path) | The path to the access key file to use for cloning the GitHub repository | `string` | `""` | no |
| <a name="input_github_repository_url"></a> [github\_repository\_url](#input\_github\_repository\_url) | The URL of the GitHub repository to clone | `string` | `""` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project used for naming resources (prefix) and accessing the web server | `string` | n/a | yes |
| <a name="input_public_key_openssh"></a> [public\_key\_openssh](#input\_public\_key\_openssh) | The public key in OpenSSH format to use for SSH access | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The name of the service used for naming resources (suffix) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nat_ip"></a> [nat\_ip](#output\_nat\_ip) | n/a |
<!-- END_TF_DOCS -->