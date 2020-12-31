variable "authorization"  {
  default = "None"
}

variable "http_method" {
  default = "ANY"
}

variable "type" {
  default = ""
}

variable "integration_http_method" {
  default = "POST"
}

variable "stage_name"    { default = "" }
variable "region"        { default = "us-east-2" }
variable "account_id"    { default = "" }
variable "function_name" { default = "" }

variable "rest_api_id"   { default = "" }
variable "parent_id"     { default = "" }
variable "resource_id"   { default = "" }
variable "uri"           { default = "" }
variable "pass_behavior" { default = "" }
