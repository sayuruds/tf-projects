# # frontend server
# module "web-ec2" {
#   source  = "terraform-aws-modules/ec2-instance/aws"

#   name = var.web-ec2_name

#   ami                    = var.web-ami
#   instance_type          = var.web-ec2_type
#   key_name               = var.web-ec2_key
#   vpc_security_group_ids = [module.web-sg.security_group_id]
#   subnet_id              = module.vpc.private_subnets[0]

#   root_block_device = [{
#     volume_size = 10
#     volume_type = "gp3"
#   }]

#   tags = {
#     creator = var.creator
#     project = var.project
#   }
# }

# # main server
# module "main-ec2" {
#   source  = "terraform-aws-modules/ec2-instance/aws"

#   name = var.main-ec2_name

#   ami                    = var.main-ami
#   instance_type          = var.main-ec2_type
#   key_name               = var.main-ec2_key
#   vpc_security_group_ids = [module.main-server-sg.security_group_id]
#   subnet_id              = module.vpc.private_subnets[1]

#   root_block_device = [{
#     volume_size = 20
#     volume_type = "gp3"
#   }]

#   tags = {
#     creator = var.creator
#     project = var.project
#   }
# }


# bastion
module "bas-ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = var.bas-ec2_name

  ami                    = var.bas-ami
  instance_type          = var.bas-ec2_type
  key_name               = var.bas-ec2_key
  vpc_security_group_ids = [module.bastion-sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  associate_public_ip_address = true

  # root_block_device = [{
  #   volume_size = 10
  #   volume_type = "gp3"
  # }]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker
              service docker start
              usermod -a -G docker ec2-user
              EOF

  tags = {
    creator = var.creator
    project = var.project
  }
}