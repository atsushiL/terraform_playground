# -----------------------------------------
# SecurityGroup
# -----------------------------------------

# -----------------------------------------
# ALB
# -----------------------------------------
resource "aws_security_group" "alb_sg" {
  name        = "${var.projectname}-${var.environment}-alb-sg"
  description = "application load balancer rule security group"
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name        = "${var.projectname}-${var.environment}-alb-sg"
    ProjectName = var.projectname
    Environment = var.environment
  }
}

resource "aws_security_group_rule" "alb_sg_ingress_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["60.139.151.124/32"]
  security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "alb_sg_ingress_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["60.139.151.124/32"]
  security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "alb_sg_egress_3000" {
  type                     = "egress"
  from_port                = 3000
  to_port                  = 3000
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.ecs_sg.id
  security_group_id        = aws_security_group.alb_sg.id
}

# -----------------------------------------
# ECS
# -----------------------------------------
resource "aws_security_group" "ecs_sg" {
  name        = "${var.projectname}-${var.environment}-ecs-sg"
  description = "ecs rule security group"
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name        = "${var.projectname}-${var.environment}-ecs-sg"
    ProjectName = var.projectname
    Environment = var.environment
  }
}

resource "aws_security_group_rule" "ecs_sg_ingress_3000" {
  type                     = "ingress"
  from_port                = 3000
  to_port                  = 3000
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.alb_sg.id
  security_group_id        = aws_security_group.ecs_sg.id
}

resource "aws_security_group_rule" "ecs_sg_egress_http" {
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.ecs_sg.id
  prefix_list_ids   = [data.aws_prefix_list.s3_pl.id]
}

resource "aws_security_group_rule" "ecs_sg_egress_https" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.ecs_sg.id
  prefix_list_ids   = [data.aws_prefix_list.s3_pl.id]
}

resource "aws_security_group_rule" "ecs_sg_egress_3306" {
  type                     = "egress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.rds_sg.id
  security_group_id        = aws_security_group.ecs_sg.id
}

# -----------------------------------------
# Operation and Management
# -----------------------------------------
resource "aws_security_group" "opmng_sg" {
  name        = "${var.projectname}-${var.environment}-opmng-sg"
  description = "operation and management rule security group"
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name        = "${var.projectname}-${var.environment}-opmng-sg"
    ProjectName = var.projectname
    Environment = var.environment
  }
}

resource "aws_security_group_rule" "opmng_sg_ingress_22" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["60.139.151.124/32"]
  security_group_id = aws_security_group.opmng_sg.id
}

resource "aws_security_group_rule" "opmng_sg_ingress_3000" {
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = ["60.139.151.124/32"]
  security_group_id = aws_security_group.opmng_sg.id
}

resource "aws_security_group_rule" "opmng_sg_egress_http" {
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.opmng_sg.id
}

resource "aws_security_group_rule" "opmng_sg_egress_https" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.opmng_sg.id
}

# -----------------------------------------
# RDS
# -----------------------------------------
resource "aws_security_group" "rds_sg" {
  name        = "${var.projectname}-${var.environment}-rds-sg"
  description = "rds rule security group"
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name        = "${var.projectname}-${var.environment}-rds-sg"
    ProjectName = var.projectname
    Environment = var.environment
  }
}

resource "aws_security_group_rule" "rds_sg_ingress_3306" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.ecs_sg.id
  security_group_id        = aws_security_group.rds_sg.id
}
