resource "aws_vpc" "main" {
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "terraform-example-elasticache"
  }
}
