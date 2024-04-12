# alb
module "alb" {
  source = "./modules/alb"
  creator = var.creator
  project = var.project

  alb-name = var.alb-name
  alb-sg = [module.alb-sg.security_group_id]
  alb-subnets = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]

  alb-tg_name = var.alb-tg_name
  vpc_id = module.vpc.vpc_id

}