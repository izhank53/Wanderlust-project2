provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = var.project_name
      ManagedBy   = "Terraform"
      Environment = var.environment
    }
  }
}

data "aws_eks_cluster" "main" {
  name = "wanderlust-dev-cluster"
}

data "aws_eks_cluster_auth" "main" {
  name = "wanderlust-dev-cluster"
}

provider "helm" {
  kubernetes = {
    host = data.aws_eks_cluster.main.endpoint

    cluster_ca_certificate = base64decode(
      data.aws_eks_cluster.main.certificate_authority[0].data
    )

    token = data.aws_eks_cluster_auth.main.token
  }
}