output "instance_public_ip" {
  value = module.ec2.instance_public_ip
}

output "main-sg-id"{
  value = module.ec2.main-sg-id
}

output "vpc-id" {
  value = module.network.vpc-id
}

output "private-avaiable_zone" {
  value = module.network.avaiable_zones[0]
}

output "private-subnet-ids" {
   value = module.network.private-subnet-ids
}