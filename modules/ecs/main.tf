# Create ECS cluster
resource "aws_ecs_cluster" "my_cluster" {
  name = var.ecs-cluster
}

# Create ECS task definition
resource "aws_ecs_task_definition" "my_task_definition" {
  family                   = var.ecs-task
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  container_definitions = jsonencode([
    {
      name      = var.ecs-container
      image     = var.ecs-image
      cpu       = 256
      memory    = 512
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
  name            = var.ecs-service
  cluster         = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_task_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.ecs-subnets # Specify subnets
    security_groups = var.ecs-security-groups # Specify security group
    assign_public_ip = true
  }

  depends_on = [aws_ecs_task_definition.my_task_definition]
}
