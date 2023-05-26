resource "aws_security_group" "main-sg" {
  name        = "${var.project}-main-sg"
  description = "Enable Inbound ports"
  vpc_id      = var.vpc-id

  ingress {
    description = "Enable SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.authorized-ssh-ip}/32"]
  }

  ingress {
    description = "Enable HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "${var.project}-main-sg"
    Project = var.project
  }
}


resource "aws_instance" "main-ec2" {
  ami                         = var.ami
  instance_type               = var.instance-type
  subnet_id                   = var.public-subnet_id
  vpc_security_group_ids      = [aws_security_group.main-sg.id]
  associate_public_ip_address = true
  key_name                    = var.keypair-name
  tags = {
    Name    = var.instance-name
    Project = var.project
  }

  # EBS root
  root_block_device {
    volume_size = 10
    volume_type = "gp2"
  }
}