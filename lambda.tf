module "lambda" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "${var.project}-lambda"
  description   = "${var.project}-lambda"
  handler       = "lambdacode.lambda_handler"
  runtime       = "python3.12"
  timeout       = 20
  
  lambda_role = aws_iam_role.lambda_role.arn
  create_role = false
  source_path = "lambdacode.py"

  tags = {
    Name = "${var.project}-lambda"
  }

  depends_on = [ aws_iam_role.lambda_role ]
}
