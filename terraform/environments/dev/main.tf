module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr             = var.vpc_cidr
  environment          = var.environment
  project_name         = var.project_name
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones

}

module "security_groups" {
  source = "../../modules/security-groups"

  project_name = var.project_name
  environment  = var.environment
  # Pass the vpc_id output from the vpc module into the vpc_id variable of the security_groups module.
  vpc_id = module.vpc.vpc_id
}


# Terraform Modules

# Definition
# │
# ├── modules/vpc
# │      │
# │      ├── variables.tf
# │      ├── main.tf
# │      └── outputs.tf
# │
# Invocation
# │
# └── environments/dev/main.tf
#         │
#         ▼
# module "vpc"
#         │
#         ▼
# Calls the reusable module


# complete flow terraform modules 

#                     environments/dev/main.tf

#                  module "vpc"
#                       │
#                       ▼
#               terraform/modules/vpc
#                       │
#           Creates VPC, Subnets, NAT...
#                       │
#                       ▼
#              output "vpc_id"
#                       │
#                       ▼
#               module.vpc.vpc_id
#                       │
#                       ▼
#         module "security_groups"
#                       │
#                       ▼
#       variable "vpc_id"
#                       │
#                       ▼
#         terraform/modules/security-groups
#                       │
#                       ▼
#       Creates all Security Groups