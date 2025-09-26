###########################################################################################
### This projects is used to practice variables and outputs and some aws services in TF ###
###########################################################################################
# I created  variables.tf and provider.tf files to keep main.tf clean and easy to read.
# In variables.tf file, I created 2 variables: ami_id and instance_type.
# In provider.tf file, I defined the AWS provider and specified the region.
# In main.tf file, I created a VPC, Subnet, Internet Gateway, Route Table, and an EC2 
# instance using the defined variables.
# I also added outputs to display the instance ID, public IP, and VPC ID after deployment.
# Tasks to be done in main.tf:
#	1.	Create VPC ✅
#	2.	Create Subnet ✅
#	3.	Attach an Internet Gateway (IGW) ✅
#	4.	Create a Route Table with 0.0.0.0/0 → IGW ✅
#	5.	Associate Route Table with Subnet ✅
#   6.	Create Security Group to allow HTTP and SSH ✅
#	7.	Create EC2 instance ✅
##########################################################################################



resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "main-rt"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "allow_http_ssh" {
  vpc_id = aws_vpc.main.id
  name   = "allow_http_ssh"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # allow from anywhere (for testing)
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http_ssh"
  }
}

resource "aws_instance" "myfirst_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]
  user_data = filebase64("userdata.sh")

  tags = {
    Name = "MyFirstInstance"
  }
}

output "instance_id" {
  value = aws_instance.myfirst_instance.id
}
output "instance_public_ip" {
  value = aws_instance.myfirst_instance.public_ip
  
}
output "vpc_id" {
  value = aws_vpc.main.id
}