variable "region" {
  default = "us-east-1"
}

variable "ami" {
  default = "ami-0715c1897453cabd1"
}

variable "instance-type" {
  default = "t3.micro"
}

variable "keypair-name" {
  default  = "devops-keypair"
}

variable "subnet_counts" {
  default  = 2
}

variable "instance-name" {
  default  = "devops-portfolio-instance"
}

variable "authorized-ssh-ip" {}
