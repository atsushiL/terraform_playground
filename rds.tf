# -----------------------------------------
# RDS parameter group
# -----------------------------------------
resource "aws_db_parameter_group" "mysql_standalone_parametergroup" {
  name   = "${var.projectname}-${var.environment}-mysql-standalone-pg"
  family = "mysql8.0"

  parameter {
    name  = "character_set_database"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }
}

# -----------------------------------------
# RDS option group
# -----------------------------------------
resource "aws_db_option_group" "mysql_standalone_optiongroup" {
  name                 = "${var.projectname}-${var.environment}-mysql-standalone-og"
  engine_name          = "mysql"
  major_engine_version = "8.0"
}

# -----------------------------------------
# RDS subnet group
# -----------------------------------------
resource "aws_db_subnet_group" "mysql_standalone-subnetgroup" {
  name = "${var.projectname}-${var.environment}-mysql-standalone-sbg"
  subnet_ids = [
    aws_subnet.rds_private_subnet_1a.id,
    aws_subnet.rds_private_subnet_1c.id,
  ]
}

# -----------------------------------------
# RDS Instance
# -----------------------------------------
# DB パスワードの生成
resource "random_string" "db_password" {
  length  = 16
  special = false
}

# resource "aws_db_instance" "mysql_standalone" {
#   # DB エンジン情報
#   engine         = "mysql"
#   engine_version = "8.0.32"

#   # DB インスタンス名
#   identifier = "${var.projectname}-${var.environment}-mysql-standalone"

#   # DB 秘匿情報
#   username = "admin"
#   password = random_string.db_password.result

#   # DB インスタンスのスペック
#   instance_class = "db.m5d.large"

#   # ストレージ
#   allocated_storage     = 20
#   max_allocated_storage = 50
#   storage_type          = "gp2"
#   storage_encrypted     = false

#   # ネットワーク
#   multi_az               = false
#   availability_zone      = "ap-northeast-1a"
#   db_subnet_group_name   = aws_db_subnet_group.mysql_standalone-subnetgroup.name
#   vpc_security_group_ids = [aws_security_group.rds_sg.id]
#   publicly_accessible    = false
#   port                   = 3306

#   # DB 名
#   name                 = "tastylog"
#   parameter_group_name = aws_db_parameter_group.mysql_standalone_parametergroup.name
#   option_group_name    = aws_db_option_group.mysql_standalone_optiongroup.name

#   # メンテナンス
#   backup_window              = "04:00-05:00"
#   backup_retention_period    = 7
#   maintenance_window         = "Mon:05:00-Mon:08:00"
#   auto_minor_version_upgrade = false

#   # インスタンス・データ削除保護
#   deletion_protection = false
#   skip_final_snapshot = true

#   # 検証環境であるため、変更を即時反映させる
#   apply_immediately = true

#   tags = {
#     Name        = "${var.projectname}-${var.environment}-mysql-standalone"
#     ProjectName = var.projectname
#     Environment = var.environment
#   }
# }
