resource "aws_lb" "app_lb" {
  name = "ecs-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [module.alb-sg.security_group_id]
  subnets = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
  
  tags = {
    project = "ecs-test"
  }

}