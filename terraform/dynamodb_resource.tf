module "dynamodb" {
  source = "./modules/dynamodb"
  name = var.table_name
  read_capacity = var.read_capacity
  write_capacity = var.write_capacity
  hash_key = var.hash_key
  dynamodb_attributes = var.attributes
  environment = var.aws-account
}