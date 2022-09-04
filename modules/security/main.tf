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

# data "aws_vpc" "vpcList" {
# }



######################## SECURITY GROUPS ########################
resource "aws_security_group" "securityGroups" {
  count = length(var.sg_information) > 0 ? length(var.sg_information) : 0  
  name        = var.sg_information[count.index].name
  description = var.sg_information[count.index].description
  vpc_id      =  var.sg_information[count.index].vpc_id
  ingress {
    description      = var.sg_information[count.index].ingress.description
    from_port        = var.sg_information[count.index].ingress.from_port
    to_port          = var.sg_information[count.index].ingress.to_port
    protocol         = var.sg_information[count.index].ingress.protocol
    cidr_blocks      = var.sg_information[count.index].ingress.cidr_blocks
    ipv6_cidr_blocks = var.sg_information[count.index].ingress.ipv6_cidr_blocks
  }

  egress {
    from_port        = var.sg_information[count.index].egress.from_port
    to_port          = var.sg_information[count.index].egress.to_port
    protocol         = var.sg_information[count.index].egress.protocol
    cidr_blocks      = var.sg_information[count.index].egress.cidr_blocks
    ipv6_cidr_blocks = var.sg_information[count.index].egress.ipv6_cidr_blocks
  }

  tags = var.sg_information[count.index].tags
}

######################## SECURITY KEYPAIR ########################
resource "aws_key_pair" "keyPair" {
  count = length(var.key_pairs) > 0 ? length(var.key_pairs) : 0  
  key_name   = var.key_pairs[count.index].key_name
  public_key = var.key_pairs[count.index].public_key
  tags = var.key_pairs[count.index].tags
  }


