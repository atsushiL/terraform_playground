module "vpc" {
  source = "../../modules/vpc/"

  project_name                  = var.project_name
  environment                   = var.environment
  availability_zone1            = var.availability_zone1
  availability_zone2            = var.availability_zone2
  vpc_cidr                      = var.vpc_cidr
  alb_public_subnet1_cidr       = var.alb_public_subnet1_cidr
  alb_public_subnet2_cidr       = var.alb_public_subnet2_cidr
  nat_public_subnet1_cidr       = var.nat_public_subnet1_cidr
  nat_public_subnet2_cidr       = var.nat_public_subnet2_cidr
  ecs_protected_subnet1_cidr    = var.ecs_protected_subnet1_cidr
  ecs_protected_subnet2_cidr    = var.ecs_protected_subnet2_cidr
  lambda_protected_subnet1_cidr = var.lambda_protected_subnet1_cidr
  lambda_protected_subnet2_cidr = var.lambda_protected_subnet2_cidr
  rds_private_subnet1_cidr      = var.rds_private_subnet1_cidr
  rds_private_subnet2_cidr      = var.rds_private_subnet2_cidr
}

module "sg" {
  source = "../../modules/sg"

  project_name = var.project_name
  environment  = var.environment
  vpc_id       = module.vpc.vpc_id
}
