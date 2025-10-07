terraform {
  backend "s3" {
    bucket = "remote-state-bucket"
    key    = "shashmitha/terraform.tfstate"
    region = "us-east-1"
    encrypt        = true
    dynamodb_table = "remote-state-lock-table"
  }
}
