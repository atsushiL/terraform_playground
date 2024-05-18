terraform {
  backend "s3" {
    bucket  = "komoriguma-tfstate"
    key     = "terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "dev-sandbox-admin"
  }
}
