AWS VPC Terraform module
===========
The goal of this project is to easily spin up an Amazon Web Services (AWS) Virtual Private Cloud (VPC) using Terraform. This module is based on Terraform community modules ([tf_aws_vpc](https://github.com/terraform-community-modules/tf_aws_vpc)).

AWS VPC Resources created:
* VPC
* Subnets
* Route tables
* Internet Gateways
* Elastic IP (EIP)
* NAT Gateways (optional)
* Key pair

## Usage
```hcl
module "network" {
  source = "./network"
  region = "${var.region_code}"
  env    = "${var.environment}"

  source_cidr_block  = "${var.source_cidr_block}"
  private_subnets    = "${var.private_subnets_cidr}"
  public_subnets     = "${var.public_subnets_cidr}"
  enable_nat_gateway = "true"
  azs                = "${var.availability_zones}"
  key_name           = "${var.key_name}"
  pub_key            = "${var.pub_key}"

  tags {
    "Terraform"   = "true"
    "Environment" = "${var.environment}"
    "Country"     = "${var.country_tags}"
  }
}
```

## Quick Start
1. Install [Terraform](https://www.terraform.io/). Terraform version: `>= Terraform v0.9.10`

2. Install and setup your [aws-cli](http://docs.aws.amazon.com/cli/latest/userguide/installing.html) with your credentials: `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`.
```hcl
$ cat ~/.aws/credentials
[default]
aws_access_key_id = xxxxxxx
aws_secret_access_key = xxxxxxx
```

3. Update `backend.tf` and `variables.tf`

4. (Optional) for code validation and formatting
```hcl
$ terraform validate
$ terraform fmt
```

5. Review changes.
```hcl
$ terraform plan
```

6. Start the build.
```hcl
$ terraform init #init remote state
$ terraform plan -out changes.terraform (optional)
$ terraform apply changes.terraform
$ rm changes.terraform
```

## Input Variables
- `cidr` - the CIDR block for the VPC
- `private_network_acl` - Network ACL for the private subnets
- `public_network_acl` - Network ACL for the public subnets
- `instance_tenancy` - A tenancy option for instances launched into the VPC
- `enable_dns_hostnames` - Use private DNS within the VPC
- `enable_dns_support` - Use private DNS within the VPC
- `public_subnets` - A list of public subnets inside the VPC
- `private_subnets` -  A list of private subnets inside the VPC
- `public_subnet_tags` - Additional tags for the public subnets
- `private_subnet_tags` - Additional tags for the public subnets
- `map_public_ip_on_launch` - Set to false if you do not want to auto-assign public IP on launch
- `enable_nat_gateway` - Set to true if you want to provision NAT Gateways for each of your private networks
- `private_propagating_vgws` - A list of VGWs the private route table should propagate  
- `public_propagating_vgws` - A list of VGWs the public route table should propagate  
- `tags` - A map of tags to add to all resources
- `azs` - A list of Availability zones in the region  
- `region` - Set default region of VPC
- `env` - Set default environment  

**NOTE**:  It's generally preferable to keep `public_subnets`, `private_subnets`, and `azs` to lists of the same length.

This module optionally creates NAT Gateways (one per availability zone) and sets them as the default gateways for the corresponding private subnets.

## Outputs

 - `vpc_id` - does what it says on the tin
 - `private_subnets` - list of private subnet ids
 - `public_subnets` - list of public subnet ids
 - `public_route_table_ids` - list of public route table ids
 - `private_route_table_ids` - list of private route table ids
 - `nat_eips` - list of Elastic IP ids (if any are provisioned)
 - `natgw_ids` - list of NAT gateway ids
 - `igw_id` - Internet Gateway id string
