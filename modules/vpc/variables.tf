variable "cidr_block" {
  type = list(string)
  description = "cidr range"
}


variable "subnets_block" {
  type = list(any)
  description = "Subnet block"
}

variable "network_Interfaces" {
  type = list(any)
  description = "Network Interfaces"
}