# Create ECS cluster
resource "aws_ecs_cluster" "my_cluster" {
  name = "my-cluster"
}

# Create ECS task definition
resource "aws_ecs_task_definition" "my_task_definition" {
  family                   = "my-task-family"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu = 1024 # requirent 1 vcpu so gave 1024
  memory = 2048 # 
  execution_role_arn = module.iam.ecs-role-arn

  container_definitions = jsonencode([
    {
      name      = "my-container"
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
  name            = "my-service"
  cluster         = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_task_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]] # Specify subnets
    security_groups = [module.alb-sg.security_group_id] # Specify security group
    assign_public_ip = true
  }

  depends_on = [aws_ecs_task_definition.my_task_definition]
}
