# ----------------------------------
# Common
# ----------------------------------
variable "project_name" {
  type        = string
  description = "Enter the project name."
  default     = "sandbox"
}

variable "environment" {
  type        = string
  description = "Enter the Environment."
  default     = "dev"
}

variable "availability_zone1" {
  description = "Enter the 1st Availability Zone name."
  type        = string
  default     = "ap-northeast-1a"
}
variable "availability_zone2" {
  description = "Enter the 2nd Availability Zone name."
  type        = string
  default     = "ap-northeast-1c"
}

# ----------------------------------
# VPC
# ----------------------------------
variable "vpc_cidr" {
  type        = string
  description = "Enter the vpc CIDR block."
  default     = "10.0.0.0/16"
}

# ----------------------------------
# Subnet
# ----------------------------------
variable "alb_public_subnet1_cidr" {
  description = "Enter the Subnet CIDR block for ALB in the 1st Availability Zone."
  type        = string
  default     = "10.0.0.0/24"
}
variable "alb_public_subnet2_cidr" {
  description = "Enter the Subnet CIDR block for ALB in the 2nd Availability Zone."
  type        = string
  default     = "10.0.16.0/24"
}
variable "nat_public_subnet1_cidr" {
  description = "Enter the Subnet CIDR block for NAT in the 1st Availability Zone."
  type        = string
  default     = "10.0.32.0/24"
}
variable "nat_public_subnet2_cidr" {
  description = "Enter the Subnet CIDR block for NAT in the 2nd Availability Zone."
  type        = string
  default     = "10.0.48.0/24"
}
variable "ecs_protected_subnet1_cidr" {
  description = "Enter the Subnet CIDR block for ECS in the 1st Availability Zone."
  type        = string
  default     = "10.0.64.0/24"
}
variable "ecs_protected_subnet2_cidr" {
  description = "Enter the Subnet CIDR block for ECS in the 2nd Availability Zone."
  type        = string
  default     = "10.0.80.0/24"
}
variable "lambda_protected_subnet1_cidr" {
  description = "Enter the Subnet CIDR block for Lambda in the 1st Availability Zone."
  type        = string
  default     = "10.0.96.0/24"
}
variable "lambda_protected_subnet2_cidr" {
  description = "Enter the Subnet CIDR block for Lambda in the 2nd Availability Zone."
  type        = string
  default     = "10.0.112.0/24"
}

variable "rds_private_subnet1_cidr" {
  description = "Enter the Subnet CIDR block for RDS in the 1st Availability Zone."
  type        = string
  default     = "10.0.128.0/24"
}
variable "rds_private_subnet2_cidr" {
  description = "Enter the Subnet CIDR block for RDS in the 2nd Availability Zone."
  type        = string
  default     = "10.0.144.0/24"
}


