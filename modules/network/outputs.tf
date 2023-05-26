output "avaiable_zones" {
  value = data.aws_availability_zones.available.names
}

output "vpc-id" {
  value = aws_vpc.main-vpc.id
}

output "public-subnet_id" {
  value = aws_subnet.public-subnet.id
}

output "private-subnet_id" {
  value = aws_subnet.private-subnet.id
}