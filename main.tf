# -----------------------------------------
# Terraform configuration
# -----------------------------------------
terraform {
  required_version = ">=0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
  backend "s3" {
    bucket = "aa.terraform-tfstate"
    key    = "tfstate-dev"
    region = "ap-northeast-1"
  }
}

# -----------------------------------------
# Variables
# -----------------------------------------
variable "projectname" {
  type = string
}

variable "environment" {
  type = string
}

# -----------------------------------------
# Provider
# クラウドプロバイダ (AWS, GCP, Azure) ・ デプロイリージョン、AWS のプロファイルなどの設定が可能
# -----------------------------------------
provider "aws" {
  region = "ap-northeast-1"
}

