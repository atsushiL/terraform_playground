module "vpc" {
  source = "../../modules/vpc/"

  projectname = "demo-terraform"
  environment = "dev"
  vpc_cidr    = "10.0.0.0/16"
}
