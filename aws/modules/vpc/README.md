<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.nat_gateway_eip1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip.nat_gateway_eip2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.nat_gateway1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_nat_gateway.nat_gateway2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.private_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.protected_route_table1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.protected_route_table2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.alb_public_subnet1_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.alb_public_subnet2_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.ecs_protected_subnet1_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.ecs_protected_subnet2_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.lambda_protected_subnet1_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.lambda_protected_subnet2_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_public_subnet1_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_public_subnet2_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.rds_private_subnet1_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.rds_private_subnet2_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.alb_public_subnet1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.alb_public_subnet2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.ecs_protected_subnet1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.ecs_protected_subnet2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.lambda_protected_subnet1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.lambda_protected_subnet2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.nat_public_subnet1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.nat_public_subnet2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.rds_private_subnet1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.rds_private_subnet2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_public_subnet1_cidr"></a> [alb\_public\_subnet1\_cidr](#input\_alb\_public\_subnet1\_cidr) | n/a | `any` | n/a | yes |
| <a name="input_alb_public_subnet2_cidr"></a> [alb\_public\_subnet2\_cidr](#input\_alb\_public\_subnet2\_cidr) | n/a | `any` | n/a | yes |
| <a name="input_availability_zone1"></a> [availability\_zone1](#input\_availability\_zone1) | n/a | `any` | n/a | yes |
| <a name="input_availability_zone2"></a> [availability\_zone2](#input\_availability\_zone2) | n/a | `any` | n/a | yes |
| <a name="input_ecs_protected_subnet1_cidr"></a> [ecs\_protected\_subnet1\_cidr](#input\_ecs\_protected\_subnet1\_cidr) | n/a | `any` | n/a | yes |
| <a name="input_ecs_protected_subnet2_cidr"></a> [ecs\_protected\_subnet2\_cidr](#input\_ecs\_protected\_subnet2\_cidr) | n/a | `any` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `any` | n/a | yes |
| <a name="input_lambda_protected_subnet1_cidr"></a> [lambda\_protected\_subnet1\_cidr](#input\_lambda\_protected\_subnet1\_cidr) | n/a | `any` | n/a | yes |
| <a name="input_lambda_protected_subnet2_cidr"></a> [lambda\_protected\_subnet2\_cidr](#input\_lambda\_protected\_subnet2\_cidr) | n/a | `any` | n/a | yes |
| <a name="input_nat_public_subnet1_cidr"></a> [nat\_public\_subnet1\_cidr](#input\_nat\_public\_subnet1\_cidr) | n/a | `any` | n/a | yes |
| <a name="input_nat_public_subnet2_cidr"></a> [nat\_public\_subnet2\_cidr](#input\_nat\_public\_subnet2\_cidr) | n/a | `any` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `any` | n/a | yes |
| <a name="input_rds_private_subnet1_cidr"></a> [rds\_private\_subnet1\_cidr](#input\_rds\_private\_subnet1\_cidr) | n/a | `any` | n/a | yes |
| <a name="input_rds_private_subnet2_cidr"></a> [rds\_private\_subnet2\_cidr](#input\_rds\_private\_subnet2\_cidr) | n/a | `any` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_public_subnet1"></a> [alb\_public\_subnet1](#output\_alb\_public\_subnet1) | A reference to the alb public subnet in the 1st Availability Zone. |
| <a name="output_alb_public_subnet2"></a> [alb\_public\_subnet2](#output\_alb\_public\_subnet2) | A reference to the alb public subnet in the 2nd Availability Zone. |
| <a name="output_ecs_protected_subnet1"></a> [ecs\_protected\_subnet1](#output\_ecs\_protected\_subnet1) | A reference to the ecs protected subnet in the 1st Availability Zone. |
| <a name="output_ecs_protected_subnet2"></a> [ecs\_protected\_subnet2](#output\_ecs\_protected\_subnet2) | A reference to the ecs protected subnet in the 2nd Availability Zone. |
| <a name="output_lambda_protected_subnet1"></a> [lambda\_protected\_subnet1](#output\_lambda\_protected\_subnet1) | A reference to the lambda protected subnet in the 1st Availability Zone. |
| <a name="output_lambda_protected_subnet2"></a> [lambda\_protected\_subnet2](#output\_lambda\_protected\_subnet2) | A reference to the lambda protected subnet in the 2nd Availability Zone. |
| <a name="output_nat_public_subnet1"></a> [nat\_public\_subnet1](#output\_nat\_public\_subnet1) | A reference to the nat public subnet in the 1st Availability Zone. |
| <a name="output_nat_public_subnet2"></a> [nat\_public\_subnet2](#output\_nat\_public\_subnet2) | A reference to the nat public subnet in the 2nd Availability Zone. |
| <a name="output_private_route_table"></a> [private\_route\_table](#output\_private\_route\_table) | A reference to the private route table. |
| <a name="output_protected_route_table1"></a> [protected\_route\_table1](#output\_protected\_route\_table1) | A reference to the protected route table in 1st Availability Zone. |
| <a name="output_protected_route_table2"></a> [protected\_route\_table2](#output\_protected\_route\_table2) | A reference to the protected route table in 2nd Availability Zone. |
| <a name="output_public_route_table"></a> [public\_route\_table](#output\_public\_route\_table) | A reference to the public route table. |
| <a name="output_rds_private_subnet1"></a> [rds\_private\_subnet1](#output\_rds\_private\_subnet1) | A reference to the rds private subnet in the 1st Availability Zone. |
| <a name="output_rds_private_subnet2"></a> [rds\_private\_subnet2](#output\_rds\_private\_subnet2) | A reference to the rds private subnet in the 2nd Availability Zone. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | A reference to the vpc id. |
<!-- END_TF_DOCS -->