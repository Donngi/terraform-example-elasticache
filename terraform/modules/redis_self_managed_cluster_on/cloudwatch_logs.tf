resource "aws_cloudwatch_log_group" "slow" {
  name = "sample-redis-self-managed-slow-log"
}

resource "aws_cloudwatch_log_group" "engine" {
  name = "sample-redis-self-managed-engine-log"
}
