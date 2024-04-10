module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc-name
  cidr = var.vpc-cidr

  azs             = var.vpc-azs
  private_subnets = var.vpc-private_subnets
  public_subnets  = var.vpc-public_subnets

  private_subnet_names = var.pvt-sub-name
  public_subnet_names = var.pub-sub-name
  igw_tags = {
    Name = var.igw-name
  }

  enable_nat_gateway = true
  single_nat_gateway = true
  manage_default_network_acl = false
  manage_default_security_group = false
  manage_default_route_table = false
  

  tags = {
    creator = var.creator
  }
}