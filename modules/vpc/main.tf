# ----------------------------------
# VPC
# ----------------------------------
resource "aws_vpc" "vpc" {
  cidr_block                       = var.vpc_cidr
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = false
  tags = {
    Name = "${var.projectname}-${var.environment}-vpc"
  }
}

# ----------------------------------
# Subnet
# ----------------------------------
resource "aws_subnet" "subnet" {
  for_each = var.subnets

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.az

  tags = {
    Name        = "${var.projectname}-${var.environment}-${each.key}"
    ProjectName = var.projectname
    Environment = var.environment
  }
}
