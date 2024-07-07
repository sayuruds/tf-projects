resource "aws_ecs_cluster" "ecs_cluster" {
  name = "webapp-ecs_cluster"
}

resource "aws_autoscaling_group" "ecs-asg" {
  desired_capacity     = 1
  max_size             = 2
  min_size             = 0
  vpc_zone_identifier  = [module.vpc.private_subnets[0]]
  launch_configuration = aws_launch_configuration.webapp-lc.id

  tag {
    key                 = "Name"
    value               = "webapp-asg"
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "webapp-lc" {
  name          = "webapp-lc"
  image_id      = "ami-0bb84b8ffd87024d8" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.ecs_instance_profile.name

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ecs_capacity_provider" "ecs-cp" {
  name = "webapp-cp"

  auto_scaling_group_provider {
    auto_scaling_group_arn         = aws_autoscaling_group.ecs-asg.arn
    #managed_termination_protection = "ENABLED"
  }
}

resource "aws_ecs_cluster_capacity_providers" "ecs-cp" {
  cluster_name          = aws_ecs_cluster.ecs_cluster.name
  capacity_providers    = [aws_ecs_capacity_provider.ecs-cp.name]
  default_capacity_provider_strategy {
    capacity_provider = aws_ecs_capacity_provider.ecs-cp.name
    weight            = 1
  }
}
