
provider "aws" {
  region  = var.region
  profile = local.aws_profile
}

resource "aws_security_group" "sg" {
  name        = "${var.instance-name}-sg"
  description = "Enable Inbound ports"
  vpc_id      = var.vpc-id

  ingress {
    description = "Enable SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.authorized-ssh-ip
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
    Name    = "${var.project}-${var.instance-name}-sg"
    Project = var.project
  }
}

resource "aws_instance" "ec2" {
  user_data                   = var.user-data
  count                       = var.servers
  ami                         = var.ami
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