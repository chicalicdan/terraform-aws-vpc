variable "region" {
  description = "Asia Pacific (Tokyo)"
  default     = "ap-northeast-1"
}

variable "profile" {
  description = "Profile in credentials file (AWS CLI)"
  default     = ""
}

variable "aws_account_id" {
  description = "Account ID to use in AWS"
  default     = [""]
}

variable "environment" {
  description = "Environment"
  default     = "prod"
}

variable "region_code" {
  description = "Region Code"
  default     = "apne1"
}

variable "availability_zones" {
  description = "Availability Zones"
  default     = ["ap-northeast-1a", "ap-northeast-1c"]
}

variable "country_tags" {
  description = "Tags for cost allocation"
  default     = "HK"
}

variable "database_subnets" {
  type        = "list"
  description = "A list of database subnets"
  default     = []
}

variable "source_cidr_block" {
  description = "Main CIRD of the VPC"
  default     = "10.1.0.0/16"
}

variable "private_subnets_cidr" {
  description = "A list of private subnets inside the VPC."
  default     = ["10.1.100.0/24", "10.1.200.0/24"]
}

variable "public_subnets_cidr" {
  description = "A list of public subnets inside the VPC."
  default     = ["10.1.1.0/24", "10.1.2.0/24"]
}

variable "key_name" {
  description = "Key pair for EC2"
  default     = ""
}

variable "pub_key" {
  description = "Key pair for EC2"
  default     = ""
}
