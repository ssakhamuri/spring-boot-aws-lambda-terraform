resource "aws_iam_role" "role" {
  name                = "${var.function_name}-role"
  assume_role_policy  = file("iam_role.json")
}

data "template_file" "policy" {
  template = file("iam_policy.json")
  vars = {
    dynamoDB_arn   = "arn:aws:dynamodb:${var.region}:${var.account_id}:table/*"
    lambda_log_arn = "arn:aws:logs:${var.region}:${var.account_id}:log-group:/aws/lambda/${var.function_name}:*"
    lambda_log_group_arn = "arn:aws:logs:${var.region}:${var.account_id}:*"
    bucket_name    = var.bucket_name
  }
}

resource "aws_iam_policy" "policy" {
  name   = "${var.function_name}-policy"
  policy = data.template_file.policy.rendered
}

# Attach the policy to the role
resource "aws_iam_role_policy_attachment" "aws_iam_role_policy_attachment" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}