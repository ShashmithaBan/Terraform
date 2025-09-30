module "aws_vpc" {
  source = "./modules/vpc"
  cidr_block = var.cidr_block
  vpc_name = var.vpc_name
}

module "aws_subnet" {
  source = "./modules/subnet"
  vpc_id = module.aws_vpc.vpc_id
}

module "aws_ig" {
  source = "./modules/internet-gateway"
  vpc_id = module.aws_vpc.vpc_id
}

module "aws_route_table" {
  source = "./modules/route-table"
  vpc_id = module.aws_vpc.vpc_id
  subnet_id = module.aws_subnet.subnet_id
  igw_id = module.aws_ig.igw_id
}

module "aws_security_group" {
  source = "./modules/security-groups"
  vpc_id = module.aws_vpc.vpc_id
  
}

module "aws_ec2" {
  source = "./modules/ec2"
  ami_id = var.ami_id
  instance_type = var.instance_type
  subnet_id = module.aws_subnet.subnet_id
  security_group_ids = module.aws_security_group.security_group_ids
  
}