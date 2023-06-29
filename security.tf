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