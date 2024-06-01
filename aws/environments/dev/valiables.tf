variable "project_name" {
  type        = string
  description = "Enter the project name."
  default     = "sandbox"
}
variable "environment" {
  type        = string
  description = "Enter the Environment."
  default     = "dev"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "availability_zone1" {
  type    = string
  default = "ap-northeast-1a"
}

variable "availability_zone2" {
  type    = string
  default = "ap-northeast-1c"
}

