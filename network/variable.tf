variable "vpc_name" {
  description = "The VPC Name to use"
  type        = string
  default     = "luqman-tf-vpc"
}

variable "cidr_range" {
  description = "The CIDR to use"
  type        = string
  default     = "10.0.0.0/16"
}