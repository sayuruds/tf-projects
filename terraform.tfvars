###################### provider ######################

region = "us-east-1"
creator = "sayurud"
project = "web_app"
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



###################### ec2 ######################

# bastion ec2
bas-ec2_name = "web_app-bastion_ec2"
bas-ami = "ami-051f8a213df8bc089"
bas-ec2_type = "t2.micro"
bas-ec2_key = "web-app-bastion-kp"


###################### alb ######################

alb-name = "web-app-alb"
alb-tg_name = "web-app-albtg"


###################### iam ######################

ecr-role = "web_app-ecr_role"
ecs-role = "web_app-ecs_role"