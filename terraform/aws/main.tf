resource "aws_vpc" "vpc10" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = "true"
}

resource "aws_vpc" "vpc20" {
  cidr_block           = "20.0.0.0/16"
  enable_dns_hostnames = "true"
}

resource "aws_internet_gateway" "igw10" {
  vpc_id = aws_vpc.vpc10.id
}

resource "aws_subnet" "subnet-pub" {
  vpc_id                  = aws_vpc.vpc10.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"
}

resource "aws_subnet" "subnet-priv" {
  vpc_id            = aws_vpc.vpc20.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "us-east-1c"
}

resource "aws_vpc_peering_connection" "vpc_peering" {
  peer_vpc_id = aws_vpc.vpc10.id
  vpc_id      = aws_vpc.vpc20.id
}
