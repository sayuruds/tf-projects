module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "ecs-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  private_subnet_names = ["ecs-pvt1", "ecs-pvt2"]
  public_subnet_names = ["ecs-pub1", "ecs-pub2"]
  igw_tags = {
    Name = "ecs-igw"
  }

  enable_nat_gateway = true
  single_nat_gateway = true
  manage_default_network_acl = false
  manage_default_security_group = false
  manage_default_route_table = false
  

  tags = {
    project = "ecs-test"
  }
}