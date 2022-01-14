locals {
    env_tag = {
        Environment = terraform.workspace
    }
    web_tags = merge(var.web_instance_tag, local.env_tag)
}

resource "aws_instance" "web" {
    ami =var.web_amis[var.aws_region]
    instance_type = var.web_instance_type
    count = var.web_instance_count
    subnet_id = local.pub_sub_ids[count.index]
    
    tags = local.web_tags 
}



