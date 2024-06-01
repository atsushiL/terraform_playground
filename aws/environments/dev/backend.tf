terraform {
  backend "s3" {
    bucket  = "komoriguma-tfstate"
    key     = "sandbox-dev-tfstate"
    region  = "ap-northeast-1"
    profile = "dev-sandbox-admin"
  }
}
