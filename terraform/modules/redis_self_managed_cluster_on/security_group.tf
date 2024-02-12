resource "aws_security_group" "redis" {
  name   = "security-group-redis"
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "allow_redis" {
  security_group_id = aws_security_group.redis.id
  cidr_ipv4         = var.vpc_cidr_block

  ip_protocol = "tcp"
  from_port   = 6379
  to_port     = 6379
}
