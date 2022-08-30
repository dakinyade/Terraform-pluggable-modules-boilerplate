############ VPC ############## 
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



########### EC2 #################
variable "ec2_values" {
  type = list(any)
  description = "ec2 Values"
}
############ END ################