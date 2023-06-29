resource "aws_instance" "ec2" {
  user_data                   = var.user-data
  count                       = var.servers
  ami                         = var.ami
  iam_instance_profile        = var.instance-profile-name
  instance_type               = var.instance-type
  subnet_id                   = var.subnet-ids[count.index]
  vpc_security_group_ids      = [aws_security_group.sg.id]
  associate_public_ip_address = true
  key_name                    = var.keypair-name
  tags = {
    Name    = "${var.instance-name}-${count.index + 1}"
    Project = var.project
  }

  # EBS root
  root_block_device {
    volume_size = 10
    volume_type = "gp2"
  }
  depends_on = [ aws_security_group.sg ]
}