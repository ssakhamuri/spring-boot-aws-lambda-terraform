variable "source_code_hash" {
  default = ""
}

variable "function_name" {
  description = "A unique name for Lambda function"
  type        = string
}

variable "runtime" {
  description = "The runtime environment for Lambda function"
  type        = string
}

variable "s3_bucket" {}

variable "approle" {
  default = "transform"
}

variable "role" {
  default = ""
}

variable "aws_account" {
  default = "dev"
}

variable "s3_key"            { }

variable "handler" {
  description = "The function entrypoint in your code"
  type        = string
}

variable "memory_size" {
  default = ""
}

variable "timeout" {
  description = "The amount of time your Lambda function had to run in seconds"
  default     = ""
}

variable "description" {
  description = "Description of what your Lambda function does"
  type        = string
  default     = ""
}

variable "environment" {
  description = "A map that defines environment variables for the Lambda Function."
  type        = map(string)
  default     = {}
}

variable "account_id" {
  description = "Account ID for role policy"
}