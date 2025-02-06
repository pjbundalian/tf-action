variable "vpc_id" {
  description = "The ID of the VPC where resources will be deployed."
  type        = string
}

variable "public_subnets" {
  description = "A list of IDs for the public subnets in the VPC."
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of IDs for the private subnets in the VPC."
  type        = list(string)
}

variable "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer."
  type        = string
}

