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

# IAM role for Lambda execution
resource "aws_iam_role" "lambda_role" {
  name = "${var.project}-lambda_execution_role"

  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action    = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "${var.project}-LambdaExecutionRole"
  }
}

# Attach AWSLambdaBasicExecutionRole policy to Lambda role
resource "aws_iam_policy_attachment" "lambda_policy_attachment" {
  name       = "lambda-policy-attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  roles       = [aws_iam_role.lambda_role.name]

  depends_on = [ aws_iam_role.lambda_role ]
}
