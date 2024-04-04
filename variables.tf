# General variables 
variable "environment" {
  description = "The name for identifying the type of environment"
  type        = string
}

variable "common_name_prefix" {
  description = "The prefix used to name all resources created."
  type        = string
}



variable "tags" {
  type        = map(string)
  description = "Any tags that should be present on the Virtual Network resources"
  default     = {}
}

#VPC Variables
variable "vpc_cidr_block" {
  description = "CIDR Block to be used by VPC"
  default = "10.0.0.0/16"
  type = string
}

variable "vpc_enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC. Defaults to true."
  default = true
  type = bool
}

variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC. Defaults to true."  
  default = true
  type = bool
}