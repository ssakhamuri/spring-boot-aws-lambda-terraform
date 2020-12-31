resource "aws_dynamodb_table" "table" {
  name           = var.name
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.hash_key
  dynamic "attribute" {
    for_each = var.dynamodb_attributes
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }
  tags = {
    Name        = var.name
    Environment = var.environment
  }
}