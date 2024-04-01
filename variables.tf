###################### provider ######################

variable "region" {
  type = string
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "creator" {
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