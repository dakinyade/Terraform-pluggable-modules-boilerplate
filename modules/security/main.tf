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

######################## SECURITY GROUPS ########################
# resource "aws_security_group_rule" "public_https_access" {
#   type              = "ingress"
#   from_port         = 0
#   to_port           = 65535
#   protocol          = "tcp"
#   cidr_blocks       = [aws_vpc.example.cidr_block]
#   ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
#   security_group_id = "sg-123456"
# }











