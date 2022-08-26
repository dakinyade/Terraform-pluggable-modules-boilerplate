module "vpc_module" {
  source = "./modules/vpc"
  cidr_block=var.cidr_block
  subnets_block=var.subnets_block
}
