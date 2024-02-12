# TODO: Fix the error below (Happended after terraform apply). 
# "InvalidParameterCombination: Cannot add replicas when cluster mode is enabled."

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "sample-redis-self-managed"
  replication_group_id = aws_elasticache_replication_group.redis.id
}

resource "aws_elasticache_replication_group" "redis" {
  replication_group_id = "redis-self-managed"
  description          = "Sample redis self-managed"

  engine               = "redis"
  engine_version       = "7.1"
  port                 = 6379
  parameter_group_name = "default.redis7.cluster.on"

  num_node_groups            = 2 # shard
  replicas_per_node_group    = 5 # 0 to 5
  multi_az_enabled           = true
  automatic_failover_enabled = true

  node_type = "cache.t3.small" # https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html

  at_rest_encryption_enabled = true

  subnet_group_name  = aws_elasticache_subnet_group.redis.name
  security_group_ids = [aws_security_group.redis.id]

  # backup
  snapshot_retention_limit = 1 # days
  snapshot_window          = "10:00-11:00"

  # maintenance
  auto_minor_version_upgrade = true
  apply_immediately          = true
  maintenance_window         = "sun:05:00-sun:09:00"

  # logging
  log_delivery_configuration {
    destination_type = "cloudwatch-logs"
    destination      = aws_cloudwatch_log_group.slow.name
    log_format       = "json"
    log_type         = "slow-log"
  }

  log_delivery_configuration {
    destination_type = "cloudwatch-logs"
    destination      = aws_cloudwatch_log_group.engine.name
    log_format       = "json"
    log_type         = "engine-log"
  }
}

resource "aws_elasticache_subnet_group" "redis" {
  name       = "sample-redis-self-managed"
  subnet_ids = var.subnet_ids

}
