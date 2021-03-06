locals {
  vpc_name = terraform.workspace == "dev" ? "vpc-dev" : "vpc-prod"
}
resource "aws_vpc" "demo_vpc" {
  # count = terraform.workspace == "dev" ? 0 : 1
  cidr_block       = var.vpc_cidr
  # cidr_block       = var.cidr_block
  instance_tenancy = var.tenancy

  tags = {
    Name        = local.vpc_name
    Environment = terraform.workspace
    Location    = "USA"
  }
}
