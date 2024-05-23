module "alb-sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "alb_sg"
  description = "open port 8080 and 80"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["http-80-tcp"]

  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "docker port"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  
  egress_rules = [ "all-all" ]
}


module "ecs-sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "ecs-sg"
  description = "open port 8080 and 80 from alb"
  vpc_id      = module.vpc.vpc_id

  ingress_with_source_security_group_id = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      source_security_group_id = "${module.alb-sg.security_group_id}"
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      source_security_group_id = "${module.alb-sg.security_group_id}"
    },
  ]
  
  egress_rules = [ "all-all" ]
}