resource "aws_subnet" "private_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 4, 1)

  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "private-1a"
  }
}

resource "aws_subnet" "private_c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 4, 2)

  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "private-1c"
  }
}
