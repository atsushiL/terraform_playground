
# ------------------------------------------
# Security Group
# ------------------------------------------
# For ALB
resource "aws_security_group" "alb_security_group" {
  name        = "${var.project_name}-${var.environment}-alb-sg"
  description = "Security Group For ALB"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.project_name}-${var.environment}-alb-sg"
    ProjectName = var.project_name
    Environment = var.environment
  }
}

# For ECS
resource "aws_security_group" "ecs_security_group" {
  name        = "${var.project_name}-${var.environment}-ecs-sg"
  description = "Security Group For ECS"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.project_name}-${var.environment}-ecs-sg"
    ProjectName = var.project_name
    Environment = var.environment
  }
}

# For Lambda
resource "aws_security_group" "lambda_security_group" {
  name        = "${var.project_name}-${var.environment}-lambda-sg"
  description = "Security Group For Lambda"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.project_name}-${var.environment}-lambda-sg"
    ProjectName = var.project_name
    Environment = var.environment
  }
}

# For RDS
resource "aws_security_group" "rds_security_group" {
  name        = "${var.project_name}-${var.environment}-rds-sg"
  description = "Security Group For RDS"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.project_name}-${var.environment}-rds-sg"
    ProjectName = var.project_name
    Environment = var.environment
  }
}
