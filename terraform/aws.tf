terraform {
  required_version = ">= 0.12"
  backend "s3" {
    region = "us-east-2"
  }
}

provider "aws" {
  region = "us-east-2"
  assume_role {
    role_arn= local.this_role_arn
  }
}