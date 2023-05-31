### terraform-aws-ec2
instance ec2 creation by terraform

## TF commands

# Plan
terraform plan -out="tfplan.out"
# Apply
terraform apply "tfplan.out"
# Destroy
terraform destroy -auto-approve

# outputs

some key fields will be returned:

- instance_public_ip
- main-sg-id
- private-avaiable_zone
- private-subnet-ids []
- vpc-id