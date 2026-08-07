output "frontend_repository_url" {
  description = "Frontend ECR Repository URL"
  value       = aws_ecr_repository.frontend.repository_url
}

output "backend_repository_url" {
  description = "Backend ECR Repository URL"
  value       = aws_ecr_repository.backend.repository_url
}

output "frontend_repository_name" {
  description = "Frontend ECR Repository Name"
  value       = aws_ecr_repository.frontend.name
}

output "backend_repository_name" {
  description = "Backend ECR Repository Name"
  value       = aws_ecr_repository.backend.name
}