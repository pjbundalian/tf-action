output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the VPC created."
}

output "public_subnet_ids" {
  value       = module.vpc.public_subnets
  description = "The IDs of the public subnets created in the VPC."
}

output "private_subnet_ids" {
  value       = module.vpc.private_subnets
  description = "The IDs of the private subnets created in the VPC."
}

output "alb_dns_name" {
  value       = module.alb.alb_dns_name
  description = "The DNS name of the Application Load Balancer."
}
