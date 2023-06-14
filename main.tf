
provider "aws" {
  region  = var.region
  profile = local.aws_profile
}

# module "network" {
#   source        = "./modules/network"
#   project       = local.project
#   subnet_counts = var.subnet_counts
# }

#using template
module "network" {
  source        = "../terraform-aws-network"
  project       = local.project
  region        = var.region
  subnet_counts = var.subnet_counts
}


module "ec2" {
  source            = "./modules/ec2"
  project           = local.project
  region            = var.region
  ami               = var.ami
  instance-type     = var.instance-type
  instance-name     = var.instance-name
  keypair-name      = var.keypair-name
  authorized-ssh-ip = var.authorized-ssh-ip
  vpc-id            = module.network.vpc-id
  public-subnet_id  = module.network.public-subnet-ids[0]
}