variable "cidr_block" {
  type = list(string)
  description = "cidr range"
}


variable "subnets_block" {
  type = list(any)
  description = "cidr range"
}