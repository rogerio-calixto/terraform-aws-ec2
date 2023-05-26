terraform {
  backend "s3" {
    profile = "devops"
    region  = "us-east-1"
    bucket  = "bucket-infrastructure-devops"
    key     = "terraform/state/tf_ec2"
    encrypt = true
  }
}