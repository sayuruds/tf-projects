# bastion
module "bas-ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "ecs-bastion"

  ami                    = var.bas-ami
  instance_type          = var.bas-ec2_type
  #key_name               = var.bas-ec2_key
  vpc_security_group_ids = [module.ecs-sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker
              service docker start
              usermod -a -G docker ec2-user
              EOF

iam_instance_profile = aws_iam_instance_profile.ec2_ssm_instance_profile.name

}