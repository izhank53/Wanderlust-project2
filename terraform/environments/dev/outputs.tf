# ==========================================
# VPC Outputs
# ==========================================
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

# ==========================================
# ECR Outputs
# ==========================================
output "ecr_frontend_url" {
  description = "URL of the Frontend ECR repository"
  value       = module.ecr.frontend_repository_url
}

output "ecr_backend_url" {
  description = "URL of the Backend ECR repository"
  value       = module.ecr.backend_repository_url
}

# ==========================================
# EKS Outputs
# ==========================================
output "eks_cluster_name" {
  description = "Name of the EKS Cluster"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "Endpoint for EKS Control Plane"
  value       = module.eks.cluster_endpoint
}