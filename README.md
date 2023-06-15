# terraform-aws-ec2
Creates ec2 instance

# Instruction:

Set the variables below according to your needs:

- project
- region
- ami
- instance-type
- keypair-name
- instance-name
- authorized-ssh-ip - list(string)-> [ For security don´t set it as default. Instead inform on terraform plan command ]

## Example:

- project           -> "tf-ec2"
- region            -> "us-east-1"
- ami               -> "ami-0715c1897453cabd1"
- instance-type     -> "t3.micro"
- keypair-name      -> "devops-keypair"
- instance-name     -> "devops-portfolio-instance"
- authorized-ssh-ip -> "123.456.789.100"

# outputs

Some key fields about infrastructure created will be returned:

- vpc-id
- private-avaiable_zones
- private-subnet-ids [] -> list(string)
- public-subnet-ids [] -> list(string)
- ec2_public_ip
- sg-id
# TF commands

## Plan
terraform plan -out="tfplan.out"
## Apply
terraform apply "tfplan.out"
## Destroy
terraform destroy -auto-approve
