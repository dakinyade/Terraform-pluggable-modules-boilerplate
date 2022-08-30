terraform {
   required_version = ">= 0.12"
  //enforcing this aws version in the module
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">=4.28.0"
    }
  }
}

############## BASIC AMI LOOKUP ####################
# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }


######################## INSTANCES ########################
resource "aws_instance" "cloudInstances" {
  count = length(var.ec2_values) > 0 ? length(var.ec2_values) : 0 
  ami   = "${var.ec2_values[count.index].ami}"
  instance_type = "${var.ec2_values[count.index].instance_type}"
  subnet_id = var.ec2_values[count.index].subnet_id
  tags = var.ec2_values[count.index].tags
}













