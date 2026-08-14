# this configure terrafrom core
terraform {

  #this project rrequired terrafrom 1.14.X , it wont unexpectedly jumps to 1.15.0
  required_version = "~> 1.14"

  # this define the provider the project needs aws, azure GCP
  required_providers {

    # we are declaring the provider here
    aws = {

      # downloads the aws provider by official hasicorp publisher from terrafrom registry
      source = "hashicorp/aws"

      # use any compatible 6.X aws provider version but dont upgarde to 7.x
      version = "~> 6.40"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.0"
    }

  }
}