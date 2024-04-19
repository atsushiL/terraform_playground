module "vpc" {
  source = "../../modules/vpc/"

  projectname = var.projectname
  environment = var.environment
  vpc_cidr    = var.vpc_cidr
}
