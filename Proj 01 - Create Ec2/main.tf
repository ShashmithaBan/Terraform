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