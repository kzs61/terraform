data "aws_caller_identity" "account-id" {}

locals {
  current_account = data.aws_caller_identity.account-id.account_id
}


resource "aws_s3_bucket" "demo_bucket" {
  bucket = var.s3_bucket
  acl    = "private"

  tags = {
    Name        = var.s3_bucket
    Environment = terraform.workspace
  }
}

resource "aws_s3_bucket" "alb_access_log" {
  bucket = var.alb_access_log_s3_bucket
  policy = data.template_file.alb_access_logpolicy.rendered
  acl    = "private"
  
  # force_destroy = true # destroys the bucket and objects
  
  tags = {
    Name        = var.alb_access_log_s3_bucket
    Environment = terraform.workspace
  }
}

data "template_file" "alb_access_logpolicy" {
    template = file("scripts/iam/elb-access-logging.json")
    vars = {
        access_logs_bucket = var.alb_access_log_s3_bucket
        policy_account_id = local.current_account
    }
}