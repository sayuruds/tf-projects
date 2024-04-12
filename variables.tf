###################### provider ######################

variable "region" {
  type = string
}

# variable "profile" {
#   type = string
# }

variable "access_key" {
  type = string
  sensitive = true
}

variable "secret_key" {
  type = string
  sensitive = true
}

variable "creator" {
  type = string
}

variable "project" {
  type = string
}


###################### vpc ######################

variable "vpc-name" {
  type = string
}

variable "vpc-cidr" {
  type = string
}

variable "vpc-azs" {
  type = list(string)
}

variable "vpc-private_subnets" {
  type = list(string)
}

variable "vpc-public_subnets" {
  type = list(string)
}

variable "pvt-sub-name" {
  type = list(string)
}

variable "pub-sub-name" {
  type = list(string)
}

variable "igw-name" {
  type = string
}



###################### ec2 ######################

# bastion ec2
variable "bas-ec2_name" {
  type = string
}

variable "bas-ami" {
  type = string
}

variable "bas-ec2_type" {
  type = string
}

# variable "bas-ec2_key" {
#   type = string
# }


###################### alb ######################

variable "alb-name" {
  type = string
}

variable "alb-tg_name" {
  type = string
}


###################### iam ######################

variable "ecr-role" {
  type = string
}

variable "ecs-role" {
  type = string
}



###################### ecs ######################

# ecs cluster
variable "ecs-cluster-name" {
  type = string
}

# ecs task definition
variable "ecs-taskdf-name" {
  type = string
}

variable "ecs-container-name" {
  type = string
}

# ecs service
variable "ecs-service-name" {
  type = string
}

