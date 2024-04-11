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


###################### alb ######################

# alb vars
variable "alb-name" {
  type = string
}

# alb tg vars
variable "alb-tg_name" {
  type = string
}

# alb listners
variable "cert-arn" {
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

variable "bas-ec2_key" {
  type = string
}


###################### ecr ######################

variable "ecr-name" {
  type = string
}


###################### iam ######################

variable "ecr-role" {
  type = string
}