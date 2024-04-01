###################### provider ######################

region = "us-east-1"
creator = "sayurud"
access_key = ""
secret_key = ""


###################### vpc ######################

vpc-name = "project-1" # same as project tag
vpc-cidr = "10.0.0.0/16"
vpc-azs = ["us-east-1a", "us-east-1b"]
vpc-private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
pvt-sub-name = ["project-1-pvt1", "project-1-pvt2"]
vpc-public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
pub-sub-name = ["project-1-pub1", "project-1-pub2"]
igw-name = "project-1-igw"