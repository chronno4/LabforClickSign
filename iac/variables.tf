#
# variables
#
variable "nginx-app_image_version" {
  default = "e6ed39f"
}

variable "rails-app_image_version" {
  default = "3135f57"
}

variable "project_name_nginx" {
  default = "nginx_app"
}

variable "project_name_rails" {
  default = "rails_app"
}

variable "Env" {
  type        = string
  description = "The environment to deploy to"
  default     = "dev"
}


variable "ecr_registry_type" {
  type = map(string)
  default = {
    "dev" = "-snapshot"
    "prd" = ""
  }
}

variable "cidr_block_vpc" {
  type = map(string)
  default = {
    "dev" = "10.0.0.0/23"
    "prd" = "10.1.0.0/23"
  }
}
variable "cidr_block_1" {
  type = map(string)
  default = {
    "dev" = "10.0.0.0/24"
    "prd" = "10.1.0.0/24"
  }
}

variable "cidr_block_2" {
  type = map(string)
  default = {
    "dev" = "10.0.1.0/24"
    "prd" = "10.1.1.0/24"
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