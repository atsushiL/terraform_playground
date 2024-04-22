
locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
  az_suffix1 = split("-", var.availability_zone1)[2]
  az_suffix2 = split("-", var.availability_zone2)[2]
  is_prd     = var.environment == "prd"
}
