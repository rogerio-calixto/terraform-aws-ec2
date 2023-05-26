output "instance_public_ip" {
  value = aws_instance.main-ec2.public_ip
}