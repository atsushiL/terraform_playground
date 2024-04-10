# -----------------------------------------
# VPC
# -----------------------------------------
resource "aws_vpc" "vpc" {
  cidr_block                       = "192.168.0.0/20"
  instance_tenancy                 = "default"
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = false
  tags = {
    Name        = "${var.projectname}-${var.environment}-vpc"
    ProjectName = var.projectname
    Environment = var.environment
  }
}

# -----------------------------------------
# Subnet
# -----------------------------------------
# ALB
resource "aws_subnet" "alb_public_subnet_1a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "192.168.0.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.projectname}-${var.environment}-alb-pub-1a"
    ProjectName = var.projectname
    Environment = var.environment
    Type        = "public"
  }
}
resource "aws_subnet" "alb_public_subnet_1c" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "192.168.1.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.projectname}-${var.environment}-alb-pub-1c"
    ProjectName = var.projectname
    Environment = var.environment
    Type        = "public"
  }
}
# NatGateway
resource "aws_subnet" "natgw_public_subnet_1a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "192.168.2.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.projectname}-${var.environment}-natgw-pub-1a"
    ProjectName = var.projectname
    Environment = var.environment
    Type        = "public"
  }
}
resource "aws_subnet" "natgw_public_subnet_1c" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "192.168.3.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.projectname}-${var.environment}-natgw-pub-1c"
    ProjectName = var.projectname
    Environment = var.environment
    Type        = "public"
  }
}
# ECS
resource "aws_subnet" "ecs_protected_subnet_1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "192.168.4.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    Name        = "${var.projectname}-${var.environment}-ecs-prot-1a"
    ProjectName = var.projectname
    Environment = var.environment
    Type        = "protected"
  }
}
resource "aws_subnet" "ecs_protected_subnet_1c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "192.168.5.0/24"
  availability_zone = "ap-northeast-1c"
  tags = {
    Name        = "${var.projectname}-${var.environment}-ecs-prot-1c"
    ProjectName = var.projectname
    Environment = var.environment
    Type        = "protected"
  }
}
# RDS
resource "aws_subnet" "rds_private_subnet_1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "192.168.6.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    Name        = "${var.projectname}-${var.environment}-rds-priv-1a"
    ProjectName = var.projectname
    Environment = var.environment
    Type        = "private"
  }
}
resource "aws_subnet" "rds_private_subnet_1c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "192.168.7.0/24"
  availability_zone = "ap-northeast-1c"
  tags = {
    Name        = "${var.projectname}-${var.environment}-rds-priv-1c"
    ProjectName = var.projectname
    Environment = var.environment
    Type        = "private"
  }
}

# -----------------------------------------
# Internet GateWay
# -----------------------------------------
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "${var.projectname}-${var.environment}-igw"
    ProjectName = var.projectname
    Environment = var.environment
  }
}

resource "aws_route" "public_rt_igw" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
}

# -----------------------------------------
# RouteTable
# -----------------------------------------
# Public
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "${var.projectname}-${var.environment}-pub-rtb"
    ProjectName = var.projectname
    Environment = var.environment
  }
}
# Protected
resource "aws_route_table" "protected_route_table_1a" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "${var.projectname}-${var.environment}-protected-rtb-1a"
    ProjectName = var.projectname
    Environment = var.environment
  }
}
resource "aws_route_table" "protected_route_table_1c" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "${var.projectname}-${var.environment}-protected-rtb-1c"
    ProjectName = var.projectname
    Environment = var.environment
  }
}
# Private
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "${var.projectname}-${var.environment}-private-rtb"
    ProjectName = var.projectname
    Environment = var.environment
  }
}

# -----------------------------------------
# RouteTable Association
# -----------------------------------------
# public
resource "aws_route_table_association" "public_route_table_alb_1a" {
  subnet_id      = aws_subnet.alb_public_subnet_1a.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_route_table_alb_1c" {
  subnet_id      = aws_subnet.alb_public_subnet_1c.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_route_table_natgw_1a" {
  subnet_id      = aws_subnet.natgw_public_subnet_1a.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_route_table_natgw_1c" {
  subnet_id      = aws_subnet.natgw_public_subnet_1c.id
  route_table_id = aws_route_table.public_route_table.id
}

# protected
resource "aws_route_table_association" "protected_route_table_ecs_1a" {
  subnet_id      = aws_subnet.ecs_protected_subnet_1a.id
  route_table_id = aws_route_table.protected_route_table_1a.id
}
resource "aws_route_table_association" "protected_route_table_ecs_1c" {
  subnet_id      = aws_subnet.ecs_protected_subnet_1c.id
  route_table_id = aws_route_table.protected_route_table_1c.id
}

# private
resource "aws_route_table_association" "private_route_table_rds_1a" {
  subnet_id      = aws_subnet.rds_private_subnet_1a.id
  route_table_id = aws_route_table.private_route_table.id
}
resource "aws_route_table_association" "protected_route_table_rds_1c" {
  subnet_id      = aws_subnet.rds_private_subnet_1c.id
  route_table_id = aws_route_table.private_route_table.id
}
