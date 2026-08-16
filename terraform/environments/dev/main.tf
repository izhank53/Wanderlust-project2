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


module "ecr" {
  source = "../../modules/ecr"

  project_name = var.project_name
  environment  = var.environment
}

module "iam" {
  source = "../../modules/iam"

  project_name = var.project_name
  environment  = var.environment

  aws_region = var.aws_region
}

module "eks" {
  source = "../../modules/eks"

  
  project_name              = var.project_name
  environment               = var.environment
  private_subnet_ids        = module.vpc.private_subnet_ids
  cluster_role_arn          = module.iam.cluster_role_arn
  node_role_arn             = module.iam.node_role_arn
  cluster_security_group_id = module.security_groups.eks_cluster_security_group_id

  vpc_id     = module.vpc.vpc_id
  aws_region = var.aws_region

  # Pass the role ARNs from IAM module
  ebs_csi_driver_role_arn               = module.iam.ebs_csi_driver_role_arn
  aws_load_balancer_controller_role_arn = module.iam.aws_load_balancer_controller_role_arn
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