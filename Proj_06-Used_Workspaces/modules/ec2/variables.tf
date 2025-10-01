variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = map(string)
  default = {
    "dev" = "ami-0360c520857e3138f"
    "stage" = "ami-0360c520857e3138f"
    "prod" = "ami-0bbdd8c17ed981ef9"
  }
  
}
variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
#   default     = {
#     dev     = "t2.micro"
#     staging = "t2.small"
#     prod    = "t2.medium"
#   }
    default     = "t2.micro"
  
}