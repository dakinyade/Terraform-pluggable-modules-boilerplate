variable "cidr_block" {
  type = list(string)
  description = "cidr range"
#   default = ["10.10.0.0/20", "10.20.0.0/20"]
}

variable "subnets_block" {
  type = list(any)
  description = "cidr range"
}