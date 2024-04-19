variable "projectname" {
  type        = string
  description = "Enter the project name."
  default     = "demo-terraform"
}

variable "environment" {
  type        = string
  description = "Enter the Environment."
  default     = "dev"
}

variable "vpc_cidr" {
  type        = string
  description = "Enter the vpc cidr."
  default     = "10.0.0.0/16"
}


