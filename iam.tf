module "iam" {
  source = "./modules/iam"

  ecr-role = var.ecr-role
}