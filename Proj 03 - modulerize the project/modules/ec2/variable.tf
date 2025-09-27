variable "subnet_id" {
  description = "id of the subnet"
  type = string
  
}

variable "instance_type" {
  description = "Type of the instance"
  type = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI id for the instance"
  type = string
  
}

variable "security_group_ids" {
  description = "List of security group ids"
  type        = string
  
}