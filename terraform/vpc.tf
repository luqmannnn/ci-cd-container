# Use an existing VPC block

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

# Use existing subnets

data "aws_subnets" "existing_subnets" {
  filter {
    name   = "tag:Name"
    values = [var.subnet_name_prefix]
  }
}