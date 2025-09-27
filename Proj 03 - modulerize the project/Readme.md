# Terraform Project 03 - Modularized Infrastructure

A modular Terraform project demonstrating infrastructure as code (IaC) best practices with reusable modules for AWS infrastructure deployment.

## 📁 Project Structure
```Proj 03 - modulerize the project/
├── modules/
│ ├── ec2/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── vpc/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ └── security-group/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
├── environments/
│ ├── dev/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ ├── terraform.tfvars
│ │ └── outputs.tf
│ └── prod/
│ ├── main.tf
│ ├── variables.tf
│ ├── terraform.tfvars
│ └── outputs.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.example
└── README.md
```
text

## 🚀 Overview

This project demonstrates how to modularize Terraform configurations for better reusability, maintainability, and scalability. The infrastructure is organized into reusable modules that can be deployed across different environments (dev, prod) with environment-specific configurations.

## 🏗️ Modules

### 1. VPC Module
Creates a Virtual Private Cloud with public and private subnets, internet gateway, and route tables.

**Key Features:**
- Customizable CIDR blocks
- Public and private subnets
- NAT gateway for private subnet internet access
- Route table configurations

### 2. Security Group Module
Defines security groups with configurable ingress and egress rules.

**Key Features:**
- Configurable port ranges
- CIDR-based rule management
- Protocol-specific rules

### 3. EC2 Module
Deploys EC2 instances with configurable instance types, AMIs, and storage.

**Key Features:**
- Multiple instance type support
- Customizable storage options


## 🛠️ Prerequisites

- Terraform v1.0+ installed
- AWS CLI configured with appropriate credentials
- Git for version control

## 📋 Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/ShashmithaBan/Terraform.git
   cd Terraform/Proj\ 03\ -\ modulerize\ the\ project
   ```
### Initialize Terraform:

```bash
terraform init
```
### Review and customize variables:

Copy the example variables file and modify according to your needs:

```bash
cp terraform.tfvars.example terraform.tfvars
```
### Plan the deployment:

```bash
terraform plan
```
### Apply the configuration:

```bash
terraform apply
```
# ⚙️ Configuration
## Main Variables
Edit terraform.tfvars or environment-specific variable files:
```
hcl
# AWS Region
aws_region = "us-east-1"

# VPC Configuration
vpc_cidr = "10.0.0.0/16"

# EC2 Instance Configuration
instance_type = "t3.micro"
ami_id = "ami-0c02fb55956c7d316"
```

