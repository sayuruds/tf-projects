module "iam" {
  source = "./modules/iam"

  ecr-role = var.ecr-role
  ecs-role = var.ecs-role
}

module "secrets" {
  source = "./modules/secrets"

  project = var.project
}