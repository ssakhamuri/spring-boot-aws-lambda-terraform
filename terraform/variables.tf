//Region
variable "region"    {default = "us-east-2"}

//Lambda Variables
variable "function_name"      { default = "Test-movies-crud" }
variable "lambda_description" { default = "Lambda function gets triggered by APIGateway" }
variable "runtime"            { default = "java11" }
variable "bucket_name"        { default = "spring-boot-lamba-terraform"}
variable "s3_key"             { default = "spring-boot-aws-lambda-terraform-0.0.1-SNAPSHOT.zip" }
variable "lambda_handler"     { default = "com.javadev.springbootawslambdaterraform.AWSStreamLambdaHandler" }
variable "timeout"            { default = "300" }
variable "memory_size"        { default = "512" }
variable "lambda_file"        { default = "spring-boot-aws-lambda-terraform-0.0.1-SNAPSHOT.zip" }

//Lambda Permission
variable "statement_id"       { default = "AllowApiGateway" }
variable "action"             { default = "lambda:InvokeFunction" }
variable "principal"          { default = "apigateway.amazonaws.com" }
variable "source_arn"         { default = "" }

//Api Gateway
variable "api_name"                   { default = "test-api" }
variable "api_description"            { default = "Rest API for testing" }
variable "endpoint_type"              { default = ["REGIONAL"] }
variable "resource_path"              { default = "movies" }
variable "http_method"                { default = "ANY" }
variable "authorization"              { default = "NONE" }
variable "integration_type"           { default = "AWS_PROXY" }
variable "integration_http_method"    { default = "POST" }
variable "uri"                        { default = "" }
variable "pass_behavior"              { default = "WHEN_NO_TEMPLATES" }

variable "options_http_method"        { default = "OPTIONS" }
variable "options_integration_type"   { default = "MOCK" }
variable "options_pass_behavior"      { default = "WHEN_NO_MATCH" }

//DynamoDB
variable "table_name" { default = "Movie" }
variable "read_capacity" { default = 5 }
variable "write_capacity" { default = 5 }
variable "hash_key" { default = "id" }
variable "attributes" {
  default = [
    {
    name = "id"
    type = "S"
    }
  ]
}