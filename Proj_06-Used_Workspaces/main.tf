#############################################################################
#This Project is using workspaces to manage different environments
#The workspaces are: dev, staging, and prod
#############################################################################


module "workspace_ec2" {
  source = "./modules/ec2"
  
}