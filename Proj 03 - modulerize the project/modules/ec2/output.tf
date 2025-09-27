output "public_ip" {
  value = aws_instance.myfirst_instance_using_modules.public_ip
  
}