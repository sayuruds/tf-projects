# create alb
resource "aws_lb" "app_lb" {
  name = var.alb-name
  internal = false
  load_balancer_type = "application"
  security_groups = var.alb-sg
  subnets = var.alb-subnets
  
  tags = {
    Name = var.alb-name
    creator = var.creator
    project = var.project
  }

}

# create target group
resource "aws_alb_target_group" "app_lb-tg" {
  name = var.alb-tg_name
  target_type = "ip"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id

  health_check {
    enabled = true
    interval = 20
    path = "/"
    timeout = 5
    matcher = 200
    healthy_threshold = 3
    unhealthy_threshold = 2
  }

  lifecycle {
    create_before_destroy = true
  }
}


# create a listner on port 80 with forward
resource "aws_lb_listener" "alb-https_listner" {
  load_balancer_arn = aws_lb.app_lb.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.app_lb-tg.arn
  }
}

