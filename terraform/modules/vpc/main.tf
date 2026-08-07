resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name        = "${var.project_name}-${var.environment}-vpc"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnet_cidrs)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name        = "${var.project_name}-${var.environment}-public-subnet-${count.index + 1}"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnet_cidrs)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name        = "${var.project_name}-${var.environment}-private-subnet-${count.index + 1}"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_internet_gateway" "main" {

  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.project_name}-${var.environment}-igw"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_eip" "eip" {
  count = length(var.public_subnet_cidrs)

  tags = {
    Name        = "${var.project_name}-${var.environment}-eip-${count.index + 1}"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_nat_gateway" "nat_gateways" {
  subnet_id     = aws_subnet.public_subnets[count.index].id
  allocation_id = aws_eip.eip[count.index].id
  count         = length(var.public_subnet_cidrs)

  tags = {
    Name        = "${var.project_name}-${var.environment}-nat-gateway-${count.index + 1}"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.project_name}-${var.environment}-public-rt"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

resource "aws_route_table_association" "public" {
  route_table_id = aws_route_table.public.id
  count          = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.public_subnets[count.index].id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  count  = length(var.private_subnet_cidrs)

  tags = {
    Name        = "${var.project_name}-${var.environment}-private-rt"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateways[count.index].id
  }
}

resource "aws_route_table_association" "private" {
  route_table_id = aws_route_table.private[count.index].id
  count          = length(var.private_subnet_cidrs)
  subnet_id      = aws_subnet.private_subnets[count.index].id

}


#                     Internet
#                          │
#                  Internet Gateway
#                          │
#               Public Route Table
#                          │
#         ┌────────────────┴───────────────┐
#         │                                │
#  Public Subnet 1                  Public Subnet 2
#         │                                │
#  Elastic IP 1                     Elastic IP 2
#         │                                │
#  NAT Gateway 1                   NAT Gateway 2
#         ▲                                ▲
#         │                                │
# Private Route Table 1          Private Route Table 2
#         ▲                                ▲
#         │                                │
# Private Subnet 1               Private Subnet 2