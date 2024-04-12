# Create ECS cluster
resource "aws_ecs_cluster" "my_cluster" {
  name = var.ecs-cluster-name
}

# Create ECS task definition
resource "aws_ecs_task_definition" "my_task_definition" {
  family                   = var.ecs-taskdf-name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu = 1024 # requirent 1 vcpu so gave 1024
  memory = 2048 
  execution_role_arn = module.iam.ecs-role-arn

  container_definitions = jsonencode([
    {
      name      = var.ecs-container-name
      image     = module.ecr.repository_url
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}

# Create ECS service
resource "aws_ecs_service" "my_service" {
  name            = var.ecs-service-name
  cluster         = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_task_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
    security_groups = [module.alb-sg.security_group_id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = module.alb.alb_tg-arn
    container_name   = var.ecs-container-name
    container_port   = 80
  }

  depends_on = [aws_ecs_task_definition.my_task_definition]
}
