
resource "aws_instance" "workspace_ec2" {
  ami           = lookup(var.ami_id, terraform.workspace)
  instance_type = var.instance_type

  tags = {
    Name = "Workspace-EC2-${terraform.workspace}"
  }
  
}