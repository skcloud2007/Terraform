# vpc, #2 subnet, #internet gateway, #Route table, #Route table assosiation

resource "aws_vpc" "my_vpc" {
  cidr_block = "var.vpc_cidr"
  instance_tenancy = "default"

  tags = {
    "name" = "my_vpc"
  }
}

resource "aws_subnet" "subnets" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr[count.index]
  count = length(var.subnet_cidr)

  tags = {
    Name = "Main"
  }
}