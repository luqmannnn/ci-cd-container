variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  default     = "vpc-0aa58eaabb536e7d3" # Change accordingly
}

variable "ex_role_arn" {
  description = "The arn of execution role"
  type        = string
  default     = "arn:aws:iam::255945442255:role/ecsTaskExecutionRole"
}

variable "sg_id" {
  description = "The security group id"
  type        = string
  default     = "sg-0d27b7c2a485d0c74" # Change accordingly
}

variable "ecs_cluster_name" {
  description = "ECS cluster name"
  type        = string
  default     = "luqman-ecs-test-cluster" # Change accordingly
}

variable "ecs_service_name" {
  description = "ECS service name"
  type        = string
  default     = "luqman-ecs-service" # Change accordingly
}

variable "ecs_task_defn_family" {
  description = "ECS task definition family name"
  type        = string
  default     = "luqmanecstaskdef"
}

variable "ecs_container_name" {
  description = "ECS container name"
  type        = string
  default     = "luqman-container"
}

variable "ecs_port_name" {
  description = "ECS port name"
  type        = string
  default     = "luqman-3000-tcp"
}

variable "ecr_url" {
  description = "ECR URL"
  type        = string
  default     = "255945442255.dkr.ecr.us-east-1.amazonaws.com"
}

variable "ecr_image_name" {
  description = "ECR image name"
  type        = string
  default     = "luqman-node-app"
}