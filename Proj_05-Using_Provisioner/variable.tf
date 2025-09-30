variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
  
}

variable "vpc_name" {
    description = "name of the vpc"
    default = "main"
    type = string
}

variable "ami_id" {
    description = "ami id for the ec2 instance"
    type = string
    
  
}
variable "instance_type" {
    description = "type of the ec2 instance"
    type = string
    default = "t2.micro"
  
}