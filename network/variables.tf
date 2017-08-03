variable "source_cidr_block" {
  description = "The CIDR block for the VPC"
  default     = ""
}

variable "private_network_acl" {
  description = "Network ACL for the private subnets"
  default     = {}
}

variable "public_network_acl" {
  description = "Network ACL for the public subnets"
  default     = {}
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  default     = "default"
}

variable "enable_dns_hostnames" {
  description = "Use private DNS within the VPC"
  default     = true
}

variable "enable_dns_support" {
  description = "Use private DNS within the VPC"
  default     = true
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC."
  default     = []
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC."
  default     = []
}

variable "public_subnet_tags" {
  description = "Additional tags for the public subnets"
  default     = {}
}

variable "private_subnet_tags" {
  description = "Additional tags for the public subnets"
  default     = {}
}

variable "map_public_ip_on_launch" {
  description = "Set to false if you do not want to auto-assign public IP on launch"
  default     = false
}

variable "enable_nat_gateway" {
  description = "Set to true if you want to provision NAT Gateways for each of your private networks"
  default     = true
}

variable "private_propagating_vgws" {
  description = "A list of VGWs the private route table should propagate."
  default     = []
}

variable "public_propagating_vgws" {
  description = "A list of VGWs the public route table should propagate."
  default     = []
}

variable "key_name" {
  description = "Key pair for EC2"
  default     = ""
}

variable "pub_key" {
  description = "Key pair for EC2"
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "azs" {
  description = "A list of Availability zones in the region"
  default     = []
}

variable "region" {
  description = "Set default region of VPC"
  default     = ""
}

variable "env" {
  description = "Set default environment"
  default     = ""
}
