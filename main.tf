provider "aws" {
  region              = "${var.region}"
  profile             = "${var.profile}"
  allowed_account_ids = "${var.aws_account_id}"
}

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
