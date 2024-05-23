# Create IAM Role for EC2 with SSM permissions
resource "aws_iam_role" "ec2_ssm_role" {
  name = "ec2-ssm_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action    = "sts:AssumeRole"
    }]
  })
}

# Attach AmazonSSMManagedInstanceCore policy to the EC2 SSM Role
resource "aws_iam_role_policy_attachment" "ec2_ssm_role_policy" {
  role       = aws_iam_role.ec2_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Attach CloudWatch Agent policy to the EC2 SSM Role (if using CloudWatch Agent)
resource "aws_iam_role_policy_attachment" "ec2_cloudwatch_agent_policy" {
  role       = aws_iam_role.ec2_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

# Create instance profile for EC2 instance
resource "aws_iam_instance_profile" "ec2_ssm_instance_profile" {
  name = "ec2-ssm_instance_profile"
  role = aws_iam_role.ec2_ssm_role.name
}
