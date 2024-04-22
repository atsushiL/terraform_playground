# ------------------------------------------
# data
# ------------------------------------------
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# ------------------------------------------
# locals
# ------------------------------------------
locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
  az_suffix1 = split("-", var.availability_zone1)[2]
  az_suffix2 = split("-", var.availability_zone2)[2]
  is_prd     = var.environment == "prd"
}


# ------------------------------------------
# VPC
# ------------------------------------------
resource "aws_vpc" "vpc" {
  cidr_block                       = var.vpc_cidr
  enable_dns_hostnames             = true
  enable_dns_support               = true
  assign_generated_ipv6_cidr_block = false
  tags = {
    Name        = "${var.project_name}-${var.environment}-vpc"
    ProjectName = var.project_name
    Environment = var.environment
  }
}

# -------------------------------------
# Internet Gateway
# -------------------------------------
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "${var.project_name}-${var.environment}-igw"
    ProjectName = var.project_name
    Environment = var.environment
  }
}

# -------------------------------------
# Public Subnets
# -------------------------------------
# For ALB
resource "aws_subnet" "alb_public_subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.alb_public_subnet1_cidr
  availability_zone       = var.availability_zone1
  map_public_ip_on_launch = false
  tags = {
    Name        = "${var.project_name}-${var.environment}-pub-alb-${local.az_suffix1}"
    ProjectName = var.project_name
    Environment = var.environment
  }
}
resource "aws_subnet" "alb_public_subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.alb_public_subnet2_cidr
  availability_zone       = var.availability_zone2
  map_public_ip_on_launch = false
  tags = {
    Name        = "${var.project_name}-${var.environment}-pub-alb-${local.az_suffix2}"
    ProjectName = var.project_name
    Environment = var.environment
  }
}
# For NAT Gateway
resource "aws_subnet" "nat_public_subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.nat_public_subnet1_cidr
  availability_zone       = var.availability_zone1
  map_public_ip_on_launch = false
  tags = {
    Name        = "${var.project_name}-${var.environment}-pub-natgw-${local.az_suffix1}"
    ProjectName = var.project_name
    Environment = var.environment
  }
}
resource "aws_subnet" "nat_public_subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.nat_public_subnet2_cidr
  availability_zone       = var.availability_zone2
  map_public_ip_on_launch = false
  tags = {
    Name        = "${var.project_name}-${var.environment}-pub-natgw-${local.az_suffix2}"
    ProjectName = var.project_name
    Environment = var.environment
  }
}

# -------------------------------------
# Protected Subnets
# -------------------------------------
# For ECS
resource "aws_subnet" "ecs_protected_subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.ecs_protected_subnet1_cidr
  availability_zone       = var.availability_zone1
  map_public_ip_on_launch = false
  tags = {
    Name        = "${var.project_name}-${var.environment}-prot-ecs-${local.az_suffix1}"
    ProjectName = var.project_name
    Environment = var.environment
  }
}
resource "aws_subnet" "ecs_protected_subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.ecs_protected_subnet2_cidr
  availability_zone       = var.availability_zone2
  map_public_ip_on_launch = false
  tags = {
    Name        = "${var.project_name}-${var.environment}-prot-ecs-${local.az_suffix2}"
    ProjectName = var.project_name
    Environment = var.environment
  }
}
# For Lambda
resource "aws_subnet" "lambda_protected_subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.lambda_protected_subnet1_cidr
  availability_zone       = var.availability_zone1
  map_public_ip_on_launch = false
  tags = {
    Name        = "${var.project_name}-${var.environment}-prot-lambda-${local.az_suffix1}"
    ProjectName = var.project_name
    Environment = var.environment
  }
}
resource "aws_subnet" "lambda_protected_subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.lambda_protected_subnet2_cidr
  availability_zone       = var.availability_zone2
  map_public_ip_on_launch = false
  tags = {
    Name        = "${var.project_name}-${var.environment}-prot-lambda-${local.az_suffix2}"
    ProjectName = var.project_name
    Environment = var.environment
  }
}

# -------------------------------------
# Private Subnets
# -------------------------------------
# For RDS
resource "aws_subnet" "rds_private_subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.rds_private_subnet1_cidr
  availability_zone       = var.availability_zone1
  map_public_ip_on_launch = false
  tags = {
    Name        = "${var.project_name}-${var.environment}-priv-rds-${local.az_suffix1}"
    ProjectName = var.project_name
    Environment = var.environment
  }
}
resource "aws_subnet" "rds_private_subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.rds_private_subnet2_cidr
  availability_zone       = var.availability_zone2
  map_public_ip_on_launch = false
  tags = {
    Name        = "${var.project_name}-${var.environment}-priv-rds-${local.az_suffix2}"
    ProjectName = var.project_name
    Environment = var.environment
  }
}

# -------------------------------------
# Public Route
# -------------------------------------
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name        = "${var.project_name}-${var.environment}-pub-rtb"
    ProjectName = var.project_name
    Environment = var.environment
  }
}
# For ALB
resource "aws_route_table_association" "alb_public_subnet1_route_table_association" {
  subnet_id      = aws_subnet.alb_public_subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "alb_public_subnet2_route_table_association" {
  subnet_id      = aws_subnet.alb_public_subnet2.id
  route_table_id = aws_route_table.public_route_table.id
}
# For NAT Gateway
resource "aws_route_table_association" "nat_public_subnet1_route_table_association" {
  subnet_id      = aws_subnet.nat_public_subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "nat_public_subnet2_route_table_association" {
  subnet_id      = aws_subnet.nat_public_subnet2.id
  route_table_id = aws_route_table.public_route_table.id
}

# -------------------------------------
# Protected Route
# -------------------------------------
resource "aws_route_table" "protected_route_table1" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway1.id
  }
  tags = {
    Name        = "${var.project_name}-${var.environment}-prot-rtb-${local.az_suffix1}"
    ProjectName = var.project_name
    Environment = var.environment
  }
}
resource "aws_route_table" "protected_route_table2" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = local.is_prd ? aws_nat_gateway.nat_gateway2[0].id : aws_nat_gateway.nat_gateway1.id
  }
  tags = {
    Name        = "${var.project_name}-${var.environment}-prot-rtb-${local.az_suffix2}"
    ProjectName = var.project_name
    Environment = var.environment
  }
}
# For ECS
resource "aws_route_table_association" "ecs_protected_subnet1_route_table_association" {
  subnet_id      = aws_subnet.ecs_protected_subnet1.id
  route_table_id = aws_route_table.protected_route_table1.id
}
resource "aws_route_table_association" "ecs_protected_subnet2_route_table_association" {
  subnet_id      = aws_subnet.ecs_protected_subnet2.id
  route_table_id = aws_route_table.protected_route_table2.id
}
# For Lambda
resource "aws_route_table_association" "lambda_protected_subnet1_route_table_association" {
  subnet_id      = aws_subnet.lambda_protected_subnet1.id
  route_table_id = aws_route_table.protected_route_table1.id
}
resource "aws_route_table_association" "lambda_protected_subnet2_route_table_association" {
  subnet_id      = aws_subnet.lambda_protected_subnet2.id
  route_table_id = aws_route_table.protected_route_table2.id
}

# -------------------------------------
# Private Route
# -------------------------------------
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "${var.project_name}-${var.environment}-priv-rtb"
    ProjectName = var.project_name
    Environment = var.environment
  }
}
resource "aws_route_table_association" "rds_private_subnet1_route_table_association" {
  subnet_id      = aws_subnet.rds_private_subnet1.id
  route_table_id = aws_route_table.private_route_table.id
}
resource "aws_route_table_association" "rds_private_subnet2_route_table_association" {
  subnet_id      = aws_subnet.rds_private_subnet2.id
  route_table_id = aws_route_table.private_route_table.id
}

# -------------------------------------
# NAT Gateway
# -------------------------------------
resource "aws_eip" "nat_gateway_eip1" {
  domain = "vpc"
  tags = {
    Name        = "${var.project_name}-${var.environment}-natgw-eip-${local.az_suffix1}"
    ProjectName = var.project_name
    Environment = var.environment
  }
}
resource "aws_nat_gateway" "nat_gateway1" {
  allocation_id = aws_eip.nat_gateway_eip1.id
  subnet_id     = aws_subnet.nat_public_subnet1.id
  tags = {
    Name        = "${var.project_name}-${var.environment}-natgw-${local.az_suffix1}"
    ProjectName = var.project_name
    Environment = var.environment
  }
}
resource "aws_eip" "nat_gateway_eip2" {
  count  = local.is_prd ? 1 : 0
  domain = "vpc"
  tags = {
    Name        = "${var.project_name}-${var.environment}-natgw-eip-${local.az_suffix2}"
    ProjectName = var.project_name
    Environment = var.environment
  }
}
resource "aws_nat_gateway" "nat_gateway2" {
  count         = local.is_prd ? 1 : 0
  allocation_id = aws_eip.nat_gateway_eip2[0].id
  subnet_id     = aws_subnet.nat_public_subnet2.id
  tags = {
    Name        = "${var.project_name}-${var.environment}-natgw-${local.az_suffix2}"
    ProjectName = var.project_name
    Environment = var.environment
  }
}
