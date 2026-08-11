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

variable "ebs_csi_driver_role_arn" {
  type        = string
  description = "IAM Role ARN for EBS CSI Driver"
}

variable "aws_load_balancer_controller_role_arn" {
  type        = string
  description = "IAM Role ARN for AWS Load Balancer Controller"
}