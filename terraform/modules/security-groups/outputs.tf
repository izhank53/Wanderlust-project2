# alb_security_group_id

# frontend_security_group_id

# backend_security_group_id

# mongodb_security_group_id

# redis_security_group_id

output "alb_security_group_id" {
  description = "alb security group id"
  value       = aws_security_group.alb.id
  sensitive   = false # Set to true if it contains passwords, keys, or secrets
}

output "frontend_security_group_id" {
  description = "frontend security group id"
  value       = aws_security_group.frontend.id
  sensitive   = false # Set to true if it contains passwords, keys, or secrets
}

output "backend_security_group_id" {
  description = "fronten security group id"
  value       = aws_security_group.backend.id
  sensitive   = false # Set to true if it contains passwords, keys, or secrets
}

output "mongodb_security_group_id" {
  description = "frontend security group id"
  value       = aws_security_group.mongodb.id
  sensitive   = false # Set to true if it contains passwords, keys, or secrets
}

output "redis_security_group_id" {
  description = "frontend security group id"
  value       = aws_security_group.redis.id
  sensitive   = false # Set to true if it contains passwords, keys, or secrets
}

output "eks_cluster_sg_id" {
  description = "EKS Cluster Security Group ID"
  value       = aws_security_group.eks_cluster.id
}