module "gcp_vpc" {
  source     = "./modules/gcp-vpc"
  project_id = local.gcp.project_id
  region     = local.gcp.region
}
