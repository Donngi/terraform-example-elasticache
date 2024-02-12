module "network" {
  source = "../../modules/network"
}

module "redis_serverless" {
  source         = "../../modules/redis_serverless"
  vpc_id         = module.network.vpc_id
  vpc_cidr_block = module.network.vpc_cidr_block
  subnet_ids     = module.network.subnet_ids
}

module "redis_self_managed_cluster_on" {
  source         = "../../modules/redis_self_managed_cluster_on"
  vpc_id         = module.network.vpc_id
  vpc_cidr_block = module.network.vpc_cidr_block
  subnet_ids     = module.network.subnet_ids
}
