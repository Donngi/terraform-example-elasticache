module "network" {
  source = "../../modules/network"
}

module "redis_serverless" {
  source         = "../../modules/redis_serverless"
  vpc_id         = module.network.vpc_id
  vpc_cidr_block = module.network.vpc_cidr_block
  subnet_ids     = module.network.subnet_ids
}
