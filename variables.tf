variable "project" {
  default = "tf-ec2"
}
variable "region" {
  default = "us-east-1"
}

variable "ami" {
  default = "ami-053b0d53c279acc90"
}

variable "instance-type" {
  default = "t3.micro"
}

variable "keypair-name" {
  default = "devops-keypair"
}

variable "instance-name" {
  default = "portfolio"
}

variable "authorized-ssh-ip" {
  type = list(string)
  default = []
}

variable "vpc-id" {}

variable "subnet-ids" {}

variable "servers" {
  default = 1
}

variable "user-data" {
  type = any
}