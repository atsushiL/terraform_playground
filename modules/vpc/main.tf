# ----------------------------------
# VPC
# ----------------------------------
resource "aws_vpc" "vpc" {
  cidr_block                       = var.vpc_cidr
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = false
  tags = {
    Name = "${var.project_name}-${var.environment}-vpc"
  }
}

# ----------------------------------
# Subnet
# ----------------------------------
# For ALB
resource "aws_subnet" "alb_public_subnet_1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.alb_public_subnet1_cidr
  availability_zone = var.availability_zone1

  tags = {
    Name        = "${var.project_name}-${var.environment}-pub-alb-1a"
    ProjectName = var.project_name
    Environment = var.environment
  }
}

resource "aws_subnet" "alb_public_subnet_1c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.alb_public_subnet2_cidr
  availability_zone = var.availability_zone2

  tags = {
    Name        = "${var.project_name}-${var.environment}-pub-alb-1c"
    ProjectName = var.project_name
    Environment = var.environment
  }
}

# For Natgateway
resource "aws_subnet" "nat_public_subnet_1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.nat_public_subnet1_cidr
  availability_zone = var.availability_zone1

  tags = {
    Name        = "${var.project_name}-${var.environment}-pub-nat-1a"
    ProjectName = var.project_name
    Environment = var.environment
  }
}

resource "aws_subnet" "nat_public_subnet_1c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.nat_public_subnet2_cidr
  availability_zone = var.availability_zone2

  tags = {
    Name        = "${var.project_name}-${var.environment}-pub-nat-1c"
    ProjectName = var.project_name
    Environment = var.environment
  }
}

# For ECS
resource "aws_subnet" "ecs_protected_subnet_1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.ecs_protected_subnet1_cidr
  availability_zone = var.availability_zone1

  tags = {
    Name        = "${var.project_name}-${var.environment}-prot-ecs-1a"
    ProjectName = var.project_name
    Environment = var.environment
  }
}

resource "aws_subnet" "ecs_protected_subnet_1c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.ecs_protected_subnet2_cidr
  availability_zone = var.availability_zone2

  tags = {
    Name        = "${var.project_name}-${var.environment}-prot-ecs-1c"
    ProjectName = var.project_name
    Environment = var.environment
  }
}

# For Lambda
resource "aws_subnet" "lambda_protected_subnet_1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.lambda_protected_subnet1_cidr
  availability_zone = var.availability_zone1

  tags = {
    Name        = "${var.project_name}-${var.environment}-prot-lambda-1a"
    ProjectName = var.project_name
    Environment = var.environment
  }
}

resource "aws_subnet" "lambda_protected_subnet_1c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.lambda_protected_subnet2_cidr
  availability_zone = var.availability_zone2

  tags = {
    Name        = "${var.project_name}-${var.environment}-prot-lambda-1c"
    ProjectName = var.project_name
    Environment = var.environment
  }
}

# For RDS
resource "aws_subnet" "rds_private_subnet_1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.rds_private_subnet1_cidr
  availability_zone = var.availability_zone1

  tags = {
    Name        = "${var.project_name}-${var.environment}-priv-rds-1a"
    ProjectName = var.project_name
    Environment = var.environment
  }
}

resource "aws_subnet" "rds_private_subnet_1c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.rds_private_subnet2_cidr
  availability_zone = var.availability_zone2

  tags = {
    Name        = "${var.project_name}-${var.environment}-priv-rds-1c"
    ProjectName = var.project_name
    Environment = var.environment
  }
}

# ----------------------------------
# Internet Gateway
# ----------------------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project_name}-${var.environment}-igw"
  }
}

# ----------------------------------
# Nat Gateway
# ----------------------------------
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
  subnet_id     = aws_subnet.nat_public_subnet_1a.id
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
  subnet_id     = aws_subnet.nat_public_subnet_1c.id
  tags = {
    Name        = "${var.project_name}-${var.environment}-natgw-${local.az_suffix2}"
    ProjectName = var.project_name
    Environment = var.environment
  }
}

# ----------------------------------
# RouteTable
# ----------------------------------
# Public RouteTable
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.project_name}-${var.environment}-pub-rtb"
  }
}

# Protected RouteTable
resource "aws_route_table" "protected_route_table_1" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.project_name}-${var.environment}-pub-rtb"
  }
}

# ----------------------------------
# RouteTable Association
# ----------------------------------
# resource "aws_route_table_association" "subnet_association" {
#   for_each = var.subnets

#   subnet_id      = aws_subnet.subnet[each.key].id
#   route_table_id = aws_route_table.route_table[each.value.route_table].id
# }
