variable "project_name" {}

variable "environment" {}

variable "cluster_role_arn" {}

variable "node_role_arn" {}

variable "private_subnet_ids" {
  type = list(string)
}

variable "cluster_security_group_id" {}

variable "kubernetes_version" {
  default = "1.33"
}