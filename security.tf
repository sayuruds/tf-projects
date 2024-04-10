# # alb sg
# module "alb-sg" {
#   source = "terraform-aws-modules/security-group/aws"

#   name        = "cpstl-poc-alb_sg"
#   description = "alb sg for port 80 and 443"
#   vpc_id      = module.vpc.vpc_id

#   ingress_cidr_blocks      = ["0.0.0.0/0"]
#   ingress_rules            = ["https-443-tcp", "http-80-tcp"]
  
#   egress_rules = [ "all-all" ]
# }

# # web server sg
# module "web-sg" {
#   source = "terraform-aws-modules/security-group/aws"

#   name        = "cpstl-poc-web_server_sg"
#   description = "web server sg for port 80 and 443"
#   vpc_id      = module.vpc.vpc_id
#   ingress_cidr_blocks      = ["0.0.0.0/0"]
#   ingress_rules            = ["https-443-tcp", "http-80-tcp"]
#   # ingress_with_source_security_group_id = [
#   #   {
#   #     from_port   = 80
#   #     to_port     = 80
#   #     protocol    = "tcp"
#   #     security_groups = [module.alb-sg.security_group_id]
      
#   #   }
#   # ]
  
#   egress_rules = [ "all-all" ]
# }

# # main server sg
# module "main-server-sg" {
#   source = "terraform-aws-modules/security-group/aws"

#   name        = "cpstl-poc-main_server_sg"
#   description = "alb sg for port 80 and 443"
#   vpc_id      = module.vpc.vpc_id

#   ingress_cidr_blocks      = ["0.0.0.0/0"]
#   ingress_rules            = ["https-443-tcp", "http-80-tcp"]
  
#   egress_rules = [ "all-all" ]
# }

# # rds sg
# module "rds-sg" {
#   source = "terraform-aws-modules/security-group/aws"

#   name        = "cpstl-poc-rds_sg"
#   description = "alb sg for port 80 and 443"
#   vpc_id      = module.vpc.vpc_id

#   ingress_with_cidr_blocks = [
#     {
#       rule        = "mysql-tcp"
#       cidr_blocks = "0.0.0.0/0"
#     },
#   ]
  
#   egress_rules = [ "all-all" ]
# }


# bastion sg
module "bastion-sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${var.project}-bastion_sg"
  description = "bastion sg for port 22"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      rule        = "ssh-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  
  egress_rules = [ "all-all" ]
}