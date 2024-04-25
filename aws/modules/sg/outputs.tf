# For ALB
output "alb_security_group" {
  description = "Security Group For ALB"
  value       = aws_security_group.alb_security_group.id
}
# For ECS
output "ecs_security_group" {
  description = "Security Group For ECS"
  value       = aws_security_group.ecs_security_group.id
}
# For Lambda
output "lambda_security_group" {
  description = "Security Group For Lambda"
  value       = aws_security_group.lambda_security_group.id
}

# For RDS
output "rds_security_group" {
  description = "Security Group For RDS"
  value       = aws_security_group.rds_security_group.id
}
