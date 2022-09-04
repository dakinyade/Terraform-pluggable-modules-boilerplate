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