provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./vpc"
}

module "ec2" {
  source       = "./ec2"
  vpc_id       = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}
