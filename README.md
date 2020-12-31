# spring-boot-aws-lambda-terraform
Java application using Spring Boot, AWS Lambda, DynamoDB and Terraform

Build the zip using the gradle task
The zip file will be located in build/distributions/spring-boot-aws-lambda-terraform-0.0.1-SNAPSHOT.zip

To deploy aws services using terraform code,

Create an S3 bucket (In my case, I set the default env to dev so using 'd-') by uploading the zip file.

Bucket name: d-spring-boot-lamba-terraform

Key: spring-boot-aws-lambda-terraform-0.0.1-SNAPSHOT.zip 

terraform init

terraform plan

terraform apply

To test the app
Using postman test the app

<API_Gateway_Invoke_URL>/movies (Can use either GET or POST method)

Example input to post call
{
	"year" : 2019,
  "title" : "Star Wars: The Rise of Skywalker"
}
