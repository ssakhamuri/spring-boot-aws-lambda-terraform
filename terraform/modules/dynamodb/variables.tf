variable "name" {
  default = " "
}

variable "read_capacity" {
  default = 5
}

variable "write_capacity" {
  default = 5
}

variable "hash_key" {
  default = " "
}

variable "stage" {
  default = " "
}

variable "dynamodb_attributes" {
  type = list(object({
    name = string
    type = string
  }))
  default     = []
  description = "DynamoDB attributes in the form of a list of mapped values"
}

variable "environment" {
  default = " "
}