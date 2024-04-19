###################### provider ######################

region = "us-east-1"
creator = "sayurud"
project = "web-app"
#profile = "web_app"
access_key = ""
secret_key = ""


###################### vpc ######################

vpc-name = "web_app"
vpc-cidr = "10.0.0.0/16"
vpc-azs = ["us-east-1a", "us-east-1b"]
vpc-private_subnets = ["10.0.1.0/24"]
pvt-sub-name = ["web_app-pvt1"]
vpc-public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
pub-sub-name = ["web_app-pub1", "web_app-pub2"]
igw-name = "web_app-igw"



###################### iam ######################

ecr-role = "web_app-ecr_role"
ecs-role = "web_app-ecs_role"


