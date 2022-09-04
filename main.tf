module "vpc_module" {
  source = "./modules/vpc"
  vpcs = var.vpcs
  gateways = var.gateways
  route_tables = var.route_tables
  route_tables_routes = var.route_tables_routes
  cidr_block=var.cidr_block
  subnets_block=var.subnets_block
  network_Interfaces= var.network_Interfaces
}

module "iam_module" {
  source = "./modules/iam"
  iam_roles = var.iam_roles
}


module "security_module" {
  source = "./modules/security"
  sg_information = var.sg_information
  key_pairs      = var.key_pairs
}

module "ec2_module" {
  source = "./modules/ec2"
  ec2_values = var.ec2_values
}
