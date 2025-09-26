output "aws_instance_public_ip" {
  value = aws_instance.myfirst_instance.public_ip
  
}
output "vpc_id" {
  value = aws_vpc.main.id
  
}
output "instance_id" {
    value = aws_instance.myfirst_instance.id
}