# # -------------------------------------
# # VPC
# # -------------------------------------
output "vpc_id" {
  description = "A reference to the vpc id."
  value       = aws_vpc.vpc.id
}

# # -------------------------------------
# # Subnet
# # -------------------------------------
# output "alb_public_subnet1" {
#   description = "A reference to the alb public subnet in the 1st Availability Zone."
#   value       = aws_subnet.alb_public_subnet1
# }
# output "alb_public_subnet2" {
#   description = "A reference to the alb public subnet in the 2nd Availability Zone."
#   value       = aws_subnet.alb_public_subnet2
# }
# # output "nat_public_subnet1" {
# #   description = "A reference to the nat public subnet in the 1st Availability Zone."
# #   value       = aws_subnet.nat_public_subnet1
# # }
# # output "nat_public_subnet2" {
# #   description = "A reference to the nat public subnet in the 2nd Availability Zone."
# #   value       = aws_subnet.nat_public_subnet2
# # }
# output "ecs_protected_subnet1" {
#   description = "A reference to the ecs protected subnet in the 1st Availability Zone."
#   value       = aws_subnet.ecs_protected_subnet1
# }
# output "ecs_protected_subnet2" {
#   description = "A reference to the ecs protected subnet in the 2nd Availability Zone."
#   value       = aws_subnet.ecs_protected_subnet2
# }
# output "lambda_protected_subnet1" {
#   description = "A reference to the lambda protected subnet in the 1st Availability Zone."
#   value       = aws_subnet.lambda_protected_subnet1
# }
# output "lambda_protected_subnet2" {
#   description = "A reference to the lambda protected subnet in the 2nd Availability Zone."
#   value       = aws_subnet.lambda_protected_subnet2
# }

# output "rds_private_subnet1" {
#   description = "A reference to the rds private subnet in the 1st Availability Zone."
#   value       = aws_subnet.rds_private_subnet1
# }
# output "rds_private_subnet2" {
#   description = "A reference to the rds private subnet in the 2nd Availability Zone."
#   value       = aws_subnet.rds_private_subnet2
# }

# # -------------------------------------
# # Route Table
# # -------------------------------------
# output "public_route_table" {
#   description = "A reference to the public route table."
#   value       = aws_route_table.public_route_table.id
# }

# output "protected_route_table1" {
#   description = "A reference to the protected route table in 1st Availability Zone."
#   value       = aws_route_table.protected_route_table1.id
# }

# output "protected_route_table2" {
#   description = "A reference to the protected route table in 2nd Availability Zone."
#   value       = aws_route_table.protected_route_table2.id
# }

# output "private_route_table" {
#   description = "A reference to the private route table."
#   value       = aws_route_table.private_route_table.id
# }
