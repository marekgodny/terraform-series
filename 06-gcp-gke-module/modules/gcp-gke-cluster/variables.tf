variable "project_id" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "region" {
  type = string
}

variable "machine_type" {
  type    = string
  default = "n1-standard-1"
}

variable "environment" {
  type    = string
  default = "workshops"
}

variable "autoscaling" {
  type = object({
    min_node_count : number
    max_node_count : number
  })
  default = {
    min_node_count = 0
    max_node_count = 1
  }
}