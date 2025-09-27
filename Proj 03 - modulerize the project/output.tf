output "public_ip" {
  value = module.aws_ec2.public_ip
}

output "vpc_id" {
  value = module.aws_vpc.vpc_id
  
}

output "subnet_id" {
  value = module.aws_subnet.subnet_id
  
}