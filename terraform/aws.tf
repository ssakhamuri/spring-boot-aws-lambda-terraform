terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = "us-east-2"
  assume_role {
    role_arn= local.this_role_arn
  }
}