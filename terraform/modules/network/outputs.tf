output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr_block" {
  value = aws_vpc.main.cidr_block
}

output "subnet_ids" {
  value = [
    aws_subnet.private_a.id,
    aws_subnet.private_c.id,
  ]
}
