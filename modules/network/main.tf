data "aws_availability_zones" "available" {}

# vpc
resource "aws_vpc" "main-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main-vpc"
  }
}

# public subnet
resource "aws_subnet" "public-subnet" {
  availability_zone       = data.aws_availability_zones.available.names[0]
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name    = "${var.project}-pub-01"
    Project = var.project
  }
}

# private subnet

resource "aws_subnet" "private-subnet" {
  availability_zone = data.aws_availability_zones.available.names[0]
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = "10.0.2.0/24"

  tags = {
    Name    = "${var.project}-pvt-01"
    Project = var.project
  }
}

# public internet
resource "aws_internet_gateway" "igw" {
  tags = {
    Name    = "${var.project}-igw"
    Project = var.project
  }
}

resource "aws_internet_gateway_attachment" "igw-attachment" {
  internet_gateway_id = aws_internet_gateway.igw.id
  vpc_id              = aws_vpc.main-vpc.id
}

# public routing
resource "aws_route_table" "route-pub" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name    = "${var.project}-rt-pub"
    Project = var.project
  }
}

resource "aws_route_table_association" "rt-association-pub" {
  route_table_id = aws_route_table.route-pub.id
  subnet_id      = aws_subnet.public-subnet.id
}

# private routing

resource "aws_route_table" "rt-prv" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name    = "${var.project}-rt-pvt"
    Project = var.project
  }
}

resource "aws_route_table_association" "rt-association-prv" {
  route_table_id = aws_route_table.rt-prv.id
  subnet_id      = aws_subnet.private-subnet.id
}