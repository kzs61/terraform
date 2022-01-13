variable "aws_region" {
    default = "us-east-1"
}

variable "cidr_block" {
    default = "10.0.0.0/16"
}

variable "tenancy" {
    default = "default"
}

variable "subnet_cidr_block" {
  type        = string
  description = "Used for public subnets"
  default     = "10.0.1.0/24"
}