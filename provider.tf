provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket         = "shark-is-in-action"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform"
  }
}

