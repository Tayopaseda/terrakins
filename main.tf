provider "aws" {
    access_key = "AKIA4KTU7FW5EBZKFT43"
    secret_key = "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"
    region = "eu-west-2"
}

module "vpc" {
  source = "./vpc"
}

module "ec2_subnet" {
  source = "./subnet"
  id = module.vpc.id
}

module "security_groups" {
  source = "./security_groups"
  vpc = module.vpc.id
}

module "route_table" {
  source = "./route_table"
  vpc = module.vpc.id
  ec2_subnet = module.ec2_subnet.ec2_id
}

module "ec2" {
  source = "./ec2"
  ec2_subnet = module.ec2_subnet.ec2_id
  ec2_sg = module.security_groups.ec2
}

module "rds" {
  source = "./rds"
  sub_id_1 = module.ec2_subnet.rds_1
  sub_id_2 = module.ec2_subnet.rds_2
  sg = module.security_groups.rds
}
