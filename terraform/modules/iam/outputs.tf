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