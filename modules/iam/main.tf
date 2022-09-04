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

resource "aws_iam_role" "IAMRoles" {
    count = length(var.iam_roles) > 0 ? length(var.iam_roles) : 0 
    path = var.iam_roles[count.index].path
    name = var.iam_roles[count.index].name
    assume_role_policy = "${file(var.iam_roles[count.index].assume_role_policy)}"
    max_session_duration = var.iam_roles[count.index].max_sesssion_duration
}











