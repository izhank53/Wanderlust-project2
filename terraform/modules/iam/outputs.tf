# ==========================================
# 4. OUTPUTS (Names and ARNs)
# ==========================================
output "cluster_role_name" {
  description = "Name of the EKS Cluster IAM Role"
  value       = aws_iam_role.eks_cluster.name
}

output "cluster_role_arn" {
  description = "ARN of the EKS Cluster IAM Role"
  value       = aws_iam_role.eks_cluster.arn
}

output "node_role_name" {
  description = "Name of the EKS Node Group IAM Role"
  value       = aws_iam_role.eks_nodes.name
}

output "node_role_arn" {
  description = "ARN of the EKS Node Group IAM Role"
  value       = aws_iam_role.eks_nodes.arn
}

output "aws_load_balancer_controller_role_arn" {
  description = "ARN of the IAM role used by the AWS Load Balancer Controller"

  value = aws_iam_role.aws_load_balancer_controller.arn
}

output "ebs_csi_driver_role_arn" {
  description = "ARN of the IAM role used by the EBS CSI Driver"

  value = aws_iam_role.ebs_csi_driver.arn
}