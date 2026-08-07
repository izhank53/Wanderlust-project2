variable "environment" {
  description = " enviroment for deploying"
  type        = string
}

variable "project_name" {
  description = "Name of the Project"
  type        = string
}

variable "aws_region" {
  description = "Aws region udner which resources will be deployed "
  type        = string
}

variable "terraform_state_bucket_name" {
  description = "S3 bucket name"
  type        = string
}