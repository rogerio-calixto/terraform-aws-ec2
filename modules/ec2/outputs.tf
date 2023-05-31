output "instance_public_ip" {
  value = aws_instance.main-ec2.public_ip
}

output "main-sg-id" {
  value = aws_security_group.main-sg.id
}