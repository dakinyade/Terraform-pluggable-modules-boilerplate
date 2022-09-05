########### IAM ROLES #################
variable "iam_roles" {
  type = list(any)
  description = "IAM Roles Values"
}

########### IAM POLICIES #################
variable "iam_policies" {
  type = list(any)
  description = "IAM Polices Values"
}

########### ROLES POLICIES ATTACHMENT ######
variable "iam_attachments" {
  type = list(any)
  description = "IAM Roles Polices Attachment Values"
}