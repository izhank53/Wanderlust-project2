terraform {
  backend "s3" {
    bucket       = "izhan-wanderlust-terraform-state"
    region       = "ap-south-2"
    key          = "environments/dev/terraform.tfstate"
    use_lockfile = true
  }
}