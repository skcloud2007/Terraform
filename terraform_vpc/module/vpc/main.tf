# vpc, #2 subnet, #internet gateway, #Route table, #Route table assosiation

resource "aws_vpc" "my_vpc" {
  cidr_block = "var.vpc_cidr"
  instance_tenancy = "default"

  tags = {
    "name" = "my_vpc"
  }
}
## 2 subnets
resource "aws_subnet" "subnets" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr[count.index]
  count = length(var.subnet_cidr)
  availability_zone = data.aws_availability_zones.names[count.intex]
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_names[count.index]
  }
}

## Internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "myInternetGateway"
  }
}

## Route table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"  ## Public access
    gateway_id = aws_internet_gateway.igw.id
  }
}

##Route table association
resource "aws_route_table_association" "rta" {
  count = length(var.subnet_cidr)
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.rt.id
}