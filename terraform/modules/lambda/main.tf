resource "aws_lambda_function" "function" {
  runtime           = var.runtime
  description       = var.description
  function_name     = var.function_name
  role              = var.role
  handler           = var.handler
  s3_bucket         = var.s3_bucket
  s3_key            = var.s3_key
  #source_code_hash  = var.source_code_hash
  timeout           = var.timeout
  memory_size       = var.memory_size

  dynamic "environment" {
    for_each = length(var.environment) > 0 ? [1] : []
    content {
      variables = var.environment
    }
  }
}