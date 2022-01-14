variable "aws_region" {
  default = "us-east-1"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "tenancy" {
  default = "default"
}

variable "nat_amis" {
  type        = string
  description = "Used for nat instances"
  default     = "ami-08e4e35cccc6189f4"
  #AMI Region must match
}

variable "nat_instance_type" {
  type        = string
  description = "Used for nat instances types"
  default     = "t2.micro"
}


variable "subnet_cidr_block" {
  type        = string
  description = "Used for public subnets"
  default     = "10.0.1.0/24"
}