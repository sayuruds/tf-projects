# Define custom IAM policy for security groups permissions
resource "aws_iam_policy" "custom_security_group_policy" {
  name        = "CustomSecurityGroupPolicy"
  description = "Custom IAM policy with permissions for security groups"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:DescribeSecurityGroups",
        "ec2:DescribeSecurityGroupRules",
        "ec2:CreateSecurityGroup",
        "ec2:DeleteSecurityGroup",
        "ec2:AuthorizeSecurityGroupIngress",
        "ec2:RevokeSecurityGroupIngress",
        "ec2:AuthorizeSecurityGroupEgress",
        "ec2:RevokeSecurityGroupEgress"
      ],
      "Resource": "*"
    }
  ]
}
EOF
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
  policy_arn = aws_iam_policy.custom_security_group_policy.arn
  roles       = [aws_iam_role.lambda_role.name]

  depends_on = [ aws_iam_role.lambda_role ]
}