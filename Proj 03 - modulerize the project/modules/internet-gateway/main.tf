resource "aws_internet_gateway" "aws_ig" {
    vpc_id = var.vpc_id

  tags = {
    Name = "Pro3-igw"
  }
  
}