# output "ec2_public_ip" {
#   value = aws_instance.ec2.public_ip
# }

output "ec2_private_ips" {
  value = aws_instance.ec2[*].private_ip
}

output "ec2_public_ips" {
  value = aws_instance.ec2[*].public_ip
}


output "sg-id" {
  value = aws_security_group.sg.id
}