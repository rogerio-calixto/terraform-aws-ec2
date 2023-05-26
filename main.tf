
provider "aws" {
  region  = var.aws_region
  profile = local.aws_profile
}

module "network" {
  source      = "./modules/network"
  project     = local.project
}

module "ec2" {
  source            = "./modules/ec2"
  project           = local.project
  region            = var.region
  ami               = var.ami
  instance_type     = var.instance_type
  name              = var.name
  keypair-name      = var.keypair-name
  authorized-ssh-ip = var.authorized-ssh-ip
  vpc-id            = module.network.vpc_id
  public-subnet_id  = module.network.public-subnet_id
}