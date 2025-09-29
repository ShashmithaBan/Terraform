module "ec2" {
  source = "./modules/ec2"
  ami_id = var.ami_id
  instance_type = var.instance_type
  
}

# module "s3_bucket" {
#   source = "./modules/s3"
#   s3_bucket = var.s3_bucket
  
# }

# module "dynamodb" {
#   source = "./modules/dynamodb"
#   dynamodb_table = var.dynamodb_table
  
# }