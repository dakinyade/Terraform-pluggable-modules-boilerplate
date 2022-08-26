terraform {
   required_version = ">= 0.12"
  //enforcing this aws version in the module
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}
############## VPC ##################
resource "aws_vpc" "main" {
  count = length(var.cidr_block) > 0 ? length(var.cidr_block) : 0 
  cidr_block       = "${var.cidr_block[count.index]}"
  instance_tenancy = "default"
  tags = {
    Name = "main_${var.cidr_block[count.index]}"
  }
}

############ SUBNETS #####################
resource "aws_subnet" "subnets" {
  count = length(var.subnets_block) > 0 ? length(var.subnets_block) : 0 
  vpc_id     = aws_vpc.main[0].id
  cidr_block = var.subnets_block[count.index].cidr_range
  availability_zone = var.subnets_block[count.index].az
  map_public_ip_on_launch = var.subnets_block[count.index].public
  tags = {
    Name = "${var.subnets_block[count.index].name}_subnet"
  }
}






















