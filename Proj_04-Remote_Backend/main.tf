################################################################
# This project is to understand how to use remote backend
# remote backend is used to store the terraform state file in a remote location
#it will solve the problem of state file having conflicts due to multiple users working on the same project
# remote backend also provides better security and reliability for the state file
################################################################

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