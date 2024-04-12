# bastion sg
module "bastion-sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${var.project}-bastion_sg"
  description = "open port 22 and 80"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["http-80-tcp"]

  ingress_with_cidr_blocks = [
    {
      rule        = "ssh-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  
  egress_rules = [ "all-all" ]
}


# alb sg
module "alb-sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${var.project}-alb_sg"
  description = "open port 8080 and 80"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["http-80-tcp"]

  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8090
      protocol    = "tcp"
      description = "docker port"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  
  egress_rules = [ "all-all" ]
}