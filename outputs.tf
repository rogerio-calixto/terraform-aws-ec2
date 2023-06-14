output "instance_public_ip" {
  value = module.ec2.instance_public_ip
}

output "main-sg-id"{
  value = module.ec2.main-sg-id
}

output "vpc-id" {
  value = module.network.vpc-id
}

output "private-avaiable_zones" {
  value = module.network.avaiable_zones
}

output "private-subnet-ids" {
   value = module.network.private-subnet-ids
}

output "public-subnet-ids" {
   value = module.network.public-subnet-ids
}