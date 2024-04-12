# ecs cluster
variable "ecs-cluster" {
  type = string
}

# ecs task
variable "ecs-task" {
  type = string
}

variable "ecs-container" {
  type = string
}

variable "ecs-image" {
  type = string
}

# ecs service
variable "ecs-service" {
  type = string
}

variable "ecs-subnets" {
  type = list(string)
}

variable "ecs-security-groups" {
  type = list(string)
}