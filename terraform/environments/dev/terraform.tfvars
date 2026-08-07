aws_region = "ap-south-2"

environment = "dev"

vpc_cidr = "10.0.0.0/16"

availability_zones = [
  "ap-south-2a",
  "ap-south-2b"
]

public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnet_cidrs = [
  "10.0.11.0/24",
  "10.0.12.0/24"
]