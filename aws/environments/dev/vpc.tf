module "vpc" {
  source             = "../../modules/vpc/"
  project_name       = var.project_name
  environment        = var.environment
  vpc_cidr           = var.vpc_cidr
  availability_zone1 = var.availability_zone1
  availability_zone2 = var.availability_zone2
}
