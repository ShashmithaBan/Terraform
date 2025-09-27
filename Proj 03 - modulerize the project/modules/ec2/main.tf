resource "aws_instance" "myfirst_instance_using_modules" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_ids]

  tags = {
    Name = "InstanceWithModules"
  }
}