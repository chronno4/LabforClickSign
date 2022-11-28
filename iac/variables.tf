#
# variables
#
variable "nginx-app_image_version" {
  default = "6b65d6c"
}

variable "rails-app_image_version" {
  default = "233232"
}

variable "project_name_nginx" {
  default = "nginx_app"
}

variable "project_name_rails" {
  default = "rails_app"
}

variable "Env" {
  default = "dev"
}


variable "ecr_registry_type" {
  type = map(string)
  default = {
    "dev" = "-snapshot"
    "prd" = ""
  }
}

variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = "The AWS profile to use to execute the commands"
  default     = "default"
}

variable "environment" {
  type        = string
  description = "The environment to deploy to"
  default     = "dev"
}

variable "region" {
  default = "us-east-1"
}

variable "profile" {
  default = "default"
}

variable "ecr_image" {
  default = ""
}

variable "desired_count" {
  default = 1
}