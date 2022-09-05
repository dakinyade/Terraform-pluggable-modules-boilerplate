############ VPC ############## 
variable "vpcs" {
  type = list(any)
  description = "list of VPCs"
}

variable "gateways" {
  type = list(any)
  description = "list of Internet gateways"
}

variable "route_tables" {
  type = list(any)
  description = "list of route tables "
}

variable "route_tables_routes" {
  type = list(any)
  description = "list of route tables routes"
}

variable "cidr_block" {
  type = list(string)
  description = "cidr range"
#   default = ["10.10.0.0/20", "10.20.0.0/20"]
}

variable "subnets_block" {
  type = list(any)
  description = "subnet range"
}

variable "network_Interfaces" {
  type = list(any)
  description = "network interfaces (ENI)"
}
###############################

########### IAM ROLES #################
variable "iam_roles" {
  type = list(any)
  description = "IAM Roles Values"
}
############ END ################

########### IAM POLICIES #################
variable "iam_policies" {
  type = list(any)
  description = "IAM Polices Values"
}
############ END ################

########### ROLES POLICIES ATTACHMENT #################
variable "iam_attachments" {
  type = list(any)
  description = "IAM Roles Polices Attachment Values"
}
############ END ################


########### EC2 #################
variable "ec2_values" {
  type = list(any)
  description = "ec2 Values"
}
############ END ################

########### SECURITY #################
variable "sg_information" {
  type = list(any)
  description = "security Values"
}
variable "key_pairs" {
  type = list(any)
  description = "All security key pair goes hear"
}

############ END ################


########### ECS CLUSTERS ##########
variable "ecs_clusters" {
  type = list(any)
  description = "ecs clusters Values"
}
############ END ################

########### ECS TASKS ##########
variable "ecs_tasks" {
  type = list(any)
  description = "ecs Tasks Values"
}
############ END ################

########### ECS SERVICES ##########
variable "ecs_services" {
  type = list(any)
  description = "ecs services Values"
}
############ END ################