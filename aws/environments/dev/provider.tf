provider "aws" {
  region  = "ap-northeast-1"
  profile = "dev-sandbox-admin"
  default_tags {
    tags = {
      ProjectName = var.project_name
      Environment = var.environment
    }
  }

}
