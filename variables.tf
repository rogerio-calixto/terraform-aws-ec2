variable "region" {
  default = "us-east-1"
}

variable "ami" {
  default = "ami-0715c1897453cabd1"
}

variable "instance_type" {
  default = "t3-micro"
}

variable "name" {
  default = "main-ec2"
}

variable "keypair-name" {
  default = ""
}

variable "authorized-ssh-ip" {

}