provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source = "./vpc"
}

module "alb" {
  source         = "./alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}

module "ec2" {
  source          = "./ec2"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}

module "cloudfront" {
  source      = "./cloudfront"
  alb_dns_name = module.alb.alb_dns_name
}

