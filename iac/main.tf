terraform {
  required_version = "0.15.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.44.0"
    }
  }

  backend "s3" {
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

##
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile

  default_tags {
    tags = {
      Project   = "Terraform Lab"
      CreatedAt = "2022-11-23"
      ManagedBy = "Terraform"
      Owner     = "Daniel Ricci"
    }
  }
}