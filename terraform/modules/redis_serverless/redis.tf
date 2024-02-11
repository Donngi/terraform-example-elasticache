resource "aws_elasticache_serverless_cache" "redis" {
  name        = "sample-redis-server-less"
  description = "Sample redis"

  engine               = "redis"
  major_engine_version = "7"

  cache_usage_limits {
    data_storage {
      maximum = 1
      unit    = "GB"
    }
    ecpu_per_second {
      maximum = 1000
    }
  }

  subnet_ids         = var.subnet_ids
  security_group_ids = [aws_security_group.redis.id]

  daily_snapshot_time      = "09:00"
  snapshot_retention_limit = 1
}
