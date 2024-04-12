variable "creator" {
  type = string
}

variable "project" {
  type = string
}

# alb vars

variable "alb-name" {
  type = string
}

variable "alb-sg" {
  type = list(string)
}

variable "alb-subnets" {
  type = list(string)
}

# alb tg vars

variable "alb-tg_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

