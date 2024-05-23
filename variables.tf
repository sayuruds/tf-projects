variable "access_key" {
  sensitive = true
  default = ""
}

variable "secret_key" {
  sensitive = true
  default = ""
}

# ecs bastion

variable "bas-ami" {
  default = "ami-0bb84b8ffd87024d8"
}

variable "bas-ec2_type" {
  default = "t2.micro"
}