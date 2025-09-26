###########################################################################################
### This projects is used to practice basics in TF ###
###########################################################################################
 # I created oinly main.tf file to keep it simple.
 # In main.tf file, I defined the AWS provider and specified the region.
 # In main.tf file, I created an EC2 instance using a specific AMI ID and instance type.
 # I also added tags to the instance for easy identification.
###########################################################################################


provider "aws" {
  region = "us-east-1"
  
}

resource "aws_instance" "myfirst_instance" {
  ami           = "ami-0360c520857e3138f" 
  instance_type = "t2.micro"
  key_name      = "github"     
  tags = {
    Name = "MyFirstInstance"
  }
  subnet_id = "subnet-0657435b89e183a6b"
}