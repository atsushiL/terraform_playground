# ----------------------------------
# Common
# ----------------------------------
variable "projectname" {
  type        = string
  description = "Enter the project name."
  default     = "demo-terraform"
}

variable "environment" {
  type        = string
  description = "Enter the Environment."
  default     = "dev"
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
variable "subnets" {
  type = map(object({
    cidr_block = string
    az         = string
  }))
  default = {
    "alb-pub-1a" = {
      cidr_block = "10.0.16.0/24"
      az         = "ap-northeast-1a"
    },
    "alb-pub-1c" = {
      cidr_block = "10.0.32.0/24"
      az         = "ap-northeast-1c"
    },
    "ecs-prot-1a" = {
      cidr_block = "10.0.48.0/24"
      az         = "ap-northeast-1a"
    },
    "ecs-prot-1c" = {
      cidr_block = "10.0.64.0/24"
      az         = "ap-northeast-1c"
    },
    "lambda-prot-1a" = {
      cidr_block = "10.0.80.0/24"
      az         = "ap-northeast-1a"
    },
    "lambda-prot-1c" = {
      cidr_block = "10.0.96.0/24"
      az         = "ap-northeast-1c"
    },
    "rds-priv-1a" = {
      cidr_block = "10.0.112.0/24"
      az         = "ap-northeast-1a"
    },
    "rds-priv-1c" = {
      cidr_block = "10.0.128.0/24"
      az         = "ap-northeast-1c"
    }
  }
}
