module "vpc_module" {
  source = "./modules/vpc"
  cidr_block=var.cidr_block
  subnets_block=var.subnets_block
  network_Interfaces= var.network_Interfaces
}

module "ec2_module" {
  source = "./modules/ec2"
  ec2_values = var.ec2_values
}
