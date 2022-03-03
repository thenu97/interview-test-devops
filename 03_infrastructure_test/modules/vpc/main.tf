resource "aws_vpc" "bink_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  tags = {
    Name = "bink_vpc"
  }
}

data "aws_availability_zones" "bink_av" {
  state = "available"
}

resource "aws_subnet" "bink_pub" {
  cidr_block        = var.pub_cidr_block
  availability_zone = data.aws_availability_zones.bink_av.names[0]
  vpc_id            = aws_vpc.bink_vpc.id
}


resource "aws_internet_gateway" "bink_igw" {
  vpc_id = aws_vpc.bink_vpc.id
  tags = {
    Name = "VPC Internet Gateway"
  }
}

resource "aws_route_table" "bink_rt" {
  vpc_id = aws_vpc.bink_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.bink_igw.id
  }

  tags = {
    Name = "bink_rt"
  }
}

resource "aws_route_table_association" "bink_rta" {
  subnet_id      = aws_subnet.bink_pub.id
  route_table_id = aws_route_table.bink_rt.id
}
