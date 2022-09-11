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
############## VPC ##################
resource "aws_vpc" "main" {
  count = length(var.vpcs) > 0 ? length(var.vpcs) : 0 
  cidr_block       = var.vpcs[count.index].cidr_block
  instance_tenancy = var.vpcs[count.index].instance_tenancy
  tags = var.vpcs[count.index].tags
}

############ SUBNETS #####################
resource "aws_subnet" "subnets" {
  count = length(var.subnets_block) > 0 ? length(var.subnets_block) : 0 
  vpc_id     = aws_vpc.main[0].id
  cidr_block = var.subnets_block[count.index].cidr_range
  availability_zone = var.subnets_block[count.index].az
  map_public_ip_on_launch = var.subnets_block[count.index].public
  tags = {
    Name = "${var.subnets_block[count.index].name}_subnet"
  }
}

############ EGRESS ONLY INTERNET GATEWAY #####################
resource "aws_egress_only_internet_gateway" "EgressInternetGW" {
  vpc_id = aws_vpc.main[0].id
  tags = {
    Name = "main_Egress_Internet_Gateway"
  }
}

############ INTERNET GATEWAY #####################
resource "aws_internet_gateway" "EC2InternetGateway" {
  count = length(var.gateways) > 0 ? length(var.gateways) : 0 
  vpc_id =  aws_vpc.main[var.gateways[count.index].vpc_index].id
}

############ ROUTE TABLE #####################
resource "aws_route_table" "EC2RouteTable" {
    count = length(var.route_tables) > 0 ? length(var.route_tables) : 0 
    vpc_id = aws_vpc.main[var.route_tables[count.index].vpc_index].id
    tags = var.route_tables[count.index].tags
}

############ ROUTE TABLE ROUTES #####################
resource "aws_route" "EC2Route" {
    count = length(var.route_tables_routes) > 0 ? length(var.route_tables_routes) : 0 
    destination_cidr_block = var.route_tables_routes[count.index].destination_cidr_block
    //egress_only_gateway_id =  try(aws_egress_only_internet_gateway.EgressInternetGW[var.route_tables_routes[count.index].egress_only_gateway_index].id, true)
    gateway_id = try(aws_internet_gateway.EC2InternetGateway[var.route_tables_routes[count.index].gatewayIndex].id, true)
    route_table_id =  aws_route_table.EC2RouteTable[var.route_tables_routes[count.index].route_table_index].id
}

############ ROUTE TABLE SUBNET ASSOCIATION #####################
resource "aws_route_table_association" "routeTableAssociation" {
  count = length(var.route_tables_association) > 0 ? length(var.route_tables_association) : 0 
  subnet_id  = var.route_tables_association[count.index].subnet_id
  route_table_id = aws_route_table.EC2RouteTable[var.route_tables_association[count.index].route_table_index].id
}

############ NETWORK INTERFACE #####################
# resource "aws_network_interface" "networkInterfaces" {
#   count = length(var.network_Interfaces) > 0 ? length(var.network_Interfaces) : 0 
#   subnet_id   = var.network_Interfaces[count.index].subnet_id
#   private_ips = length(var.network_Interfaces[count.index].private_ips) > 0 ? var.network_Interfaces[count.index].private_ips : []
#   tags = var.network_Interfaces[count.index].tags

# }


















