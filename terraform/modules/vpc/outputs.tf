# VPC ID

# Public Subnet IDs

# Private Subnet IDs


output "vpc_id" {
  description = "vpc id"
  value       = aws_vpc.main.id
  sensitive   = false # Set to true if it contains passwords, keys, or secrets
}

output "public_subnet_ids" {
  description = "public subnet ids"
  value       = aws_subnet.public_subnets[*].id
  sensitive   = false # Set to true if it contains passwords, keys, or secrets
}

output "private_subnet_ids" {
  description = "private subnet id"
  value       = aws_subnet.private_subnets[*].id
  sensitive   = false # Set to true if it contains passwords, keys, or secrets
}
