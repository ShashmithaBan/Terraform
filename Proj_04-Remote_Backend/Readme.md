# Terraform Remote Backend with State Locking

This project demonstrates Terraform infrastructure as code using a modular approach with remote state management and state locking using AWS S3 and DynamoDB.

## 📁 Project Structure
```
Proj_04-Remote_Backend/
├── main.tf # Main configuration file
├── variables.tf # Variable definitions
├── outputs.tf # Output definitions
├── terraform.tfvars # Variable values (create from terraform.tfvars.example)
├── terraform.tfvars.example # Example variables file
└── modules/ # Reusable modules
├── vpc/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
├── ec2/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
└── s3/
├── main.tf
├── variables.tf
└── outputs.tf

text
```
## 🚀 Features

- **Modular Architecture**: Reusable, maintainable code structure
- **Remote State Management**: State files stored in AWS S3
- **State Locking**: Concurrent operations prevented using DynamoDB
- **Secure Configuration**: Sensitive data handled through variables
- **Scalable Design**: Easy to extend and modify

## ⚙️ Prerequisites

- Terraform v1.0+ installed
- AWS CLI configured with appropriate permissions
- AWS account with S3 and DynamoDB access

## 🔧 Configuration

### Backend Configuration

The remote backend is configured in `main.tf`:

```hcl
terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
```
### Required Variables
Create terraform.tfvars from the example file:
```
bash
cp terraform.tfvars.example terraform.tfvars
Edit terraform.tfvars with your values:

hcl
# S3 Bucket for Remote State
s3_bucket = "your-unique-terraform-state-bucket"

# DynamoDB Table for State Locking
dynamodb_table = "terraform-state-lock"

# EC2 Configuration
instance_type = "t2.micro"
ami_id = "ami-##############"

```

## 🛠️ Usage
### Initial Setup
Create S3 Bucket and DynamoDB Table (one-time setup):
```
bash
# Create S3 bucket for state storage
aws s3 mb s3://your-terraform-state-bucket --region us-east-1

# Create DynamoDB table for state locking
aws dynamodb create-table \
  --table-name terraform-state-lock \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
  --region us-east-1
```
### Initialize Terraform:
```
terraform init
terraform plan
terraform apply
terraform destroy
```

## 📞 Support
For issues and questions:

Check Terraform documentation

Review AWS service limits

Validate variable configurations
