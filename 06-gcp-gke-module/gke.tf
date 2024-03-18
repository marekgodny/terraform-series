module "gcp_gke_cluster" {
  source       = "./modules/gcp-gke-cluster"
  project_id   = local.gcp.project_id
  vpc_name     = module.gcp_vpc.vpc_name
  subnet_name  = module.gcp_vpc.subnet_name
  region       = local.gcp.region
  machine_type = "e2-highcpu-2"
  autoscaling = {
    min_node_count = 1
    max_node_count = 5
  }
}
