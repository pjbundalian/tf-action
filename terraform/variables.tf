variable "vpc_id" {
  description = "The ID of the VPC where resources will be deployed.."
  type        = string
  default     = null
}

variable "public_subnets" {
  description = "A list of IDs for the public subnets in the VPC."
  type        = list(string)
  default     = null
}

variable "private_subnets" {
  description = "A list of IDs for the private subnets in the VPC."
  type        = list(string)
  default     = null
}

variable "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer."
  type        = string
  default     = null
}

