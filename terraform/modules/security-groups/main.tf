resource "aws_security_group" "alb" {
    vpc_id = var.vpc_id
    description = "Security Group for Application Load Balancer"

    ingress {
        protocol = "tcp"
        from_port = 80
        to_port   = 80
        cidr_blocks = ["0.0.0.0/0"] 
    }

    ingress {
        protocol = "tcp"
        from_port = 443
        to_port   = 443
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        protocol = "-1"
        from_port = 0
        to_port   = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
    Name        = "${var.project_name}-${var.environment}-alb-sg"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_security_group" "frontend" {
    vpc_id = var.vpc_id
    description = "Security Group for frontend "

    ingress {
        protocol        = "tcp"
        from_port       = 80
        to_port         = 80
        security_groups = [aws_security_group.alb.id]
    }
    
    egress {
        protocol = "-1"
        from_port = 0
        to_port   = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
    Name        = "${var.project_name}-${var.environment}-frontend-sg"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_security_group" "backend" {
    vpc_id = var.vpc_id
    description = "Security Group for backend"

    ingress {
        protocol        = "tcp"
        from_port       = 5000
        to_port         = 5000
        security_groups = [aws_security_group.frontend.id]
    }
    
    egress {
        protocol = "-1"
        from_port = 0
        to_port   = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
    Name        = "${var.project_name}-${var.environment}-backend-sg"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_security_group" "mongodb" {
    vpc_id = var.vpc_id
    description = "Security Group for mongodb"

    ingress {
        protocol        = "tcp"
        from_port       = 27017
        to_port         = 27017
        security_groups = [aws_security_group.backend.id]
    }
 
    egress {
        protocol = "-1"
        from_port = 0
        to_port   = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
    Name        = "${var.project_name}-${var.environment}-mongodb-sg"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_security_group" "redis" {
    vpc_id = var.vpc_id
    description = "Security Group for redis"

    ingress {
        protocol        = "tcp"
        from_port       = 6379
        to_port         = 6379
        security_groups = [aws_security_group.backend.id]
    }
 
    egress {
        protocol = "-1"
        from_port = 0
        to_port   = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
    Name        = "${var.project_name}-${var.environment}-redis-sg"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}