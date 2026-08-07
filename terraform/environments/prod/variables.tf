variable "aws_region" {
  type    = string
  default = "ap-south-2"
}

variable "project_name" {
  type    = string
  default = "wanderlust"
}

variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}