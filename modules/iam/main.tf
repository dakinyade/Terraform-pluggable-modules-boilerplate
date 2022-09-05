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

locals {
  account_id = 123445566787
}


################## IAM ROLES ################## 
resource "aws_iam_role" "IAMRoles" {
    count = length(var.iam_roles) > 0 ? length(var.iam_roles) : 0 
    path = var.iam_roles[count.index].path
    name = var.iam_roles[count.index].name
    assume_role_policy = "${file(var.iam_roles[count.index].assume_role_policy_file)}"
    max_session_duration = var.iam_roles[count.index].max_sesssion_duration
}

################## IAM POLICIES ################## 
resource "aws_iam_policy" "policies" {
  count = length(var.iam_policies) > 0 ? length(var.iam_policies) : 0 
  name        = var.iam_policies[count.index].name
  description = var.iam_policies[count.index].description
  policy      = "${file(var.iam_policies[count.index].policy_file)}"
}

################## ROLES POLICIES ATTACHMENT ################## 
resource "aws_iam_role_policy_attachment" "IAMRolePOlicyAttachment" {
  count = length(var.iam_attachments) > 0 ? length(var.iam_attachments) : 0
  role       = "${var.iam_attachments[count.index].role_name}"
  policy_arn = "arn:aws:iam::${local.account_id}:policy/${var.iam_attachments[count.index].policy_name}"
  depends_on = [
    aws_iam_policy.policies
  ]
}



