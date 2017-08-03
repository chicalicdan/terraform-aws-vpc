terraform {
  backend "s3" {
    bucket  = "s3bucket"                    # S3 bucket
    key     = "terraform/terraform.tfstate" # Object
    region  = "ap-northeast-1"              # Region of S3 bucket
    profile = "aws-cli-account"             # AWS CLI profile
  }
}
