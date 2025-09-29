variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  
}

variable "instance_type" {
  description = "The type of instance to use"
  type        = string
  default     = "t2.micro"
  
}

variable "s3_bucket" {
  description = "The name of the S3 bucket for remote state"
  type        = string
  
}

variable "dynamodb_table" {
  description = "The name of the DynamoDB table for state locking"
  type        = string
  
}