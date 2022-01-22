variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
# variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "tenancy" {
  default = "default"
}

variable "web_amis" {
  type        = map
  description = "Used for web instances"
  default     = {
    us-east-1 = "ami-08e4e35cccc6189f4"
    us-east-2 = "ami-001089eb624938d9f"
    #AMI Region must match with region
    }
}

variable "web_instance_type" {
  type        = string
  description = "Used for web instances types"
  default     = "t2.micro"
}

variable "web_instance_count" {
  type        = string
  description = "Number of instances"
  default     = "2"
}

variable "web_instance_tag" {
 type        = map
  description = "Used for web instances names"
  default     = {
      Name = "webserver"
  }
}

variable "s3_bucket" {
  type = string 
  default = "demo-s3-bucket-12345"
}


variable "subnet_cidr_block" {
  type        = string
  description = "Used for public subnets"
  default     = "10.0.1.0/24"
}


variable "alb_access_log_s3_bucket" {
  type = string 
  default = "demo-alb-access-logs-bucket"
}