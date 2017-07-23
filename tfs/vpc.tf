resource "aws_vpc" "vpc" {
  cidr_block = "10.10.0.0/16"
  tags {
    Name = "${var.app_name}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name = "${var.app_name}-igw"
  }
}

resource "aws_subnet" "public-subnet-a" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "10.10.10.0/24"
  availability_zone = "${var.aws_region}a"
  tags {
    Name = "${var.app_name}-public-subnet-a"
  }
}
resource "aws_subnet" "public-subnet-c" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "10.10.11.0/24"
  availability_zone = "${var.aws_region}c"
  tags {
    Name = "${var.app_name}-public-subnet-c"
  }
}
resource "aws_subnet" "private-subnet-a" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "10.10.200.0/24"
  availability_zone = "${var.aws_region}a"
  tags {
    Name = "${var.app_name}-private-subnet-a"
  }
}
resource "aws_subnet" "private-subnet-c" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "10.10.201.0/24"
  availability_zone = "${var.aws_region}c"
  tags {
    Name = "${var.app_name}-private-subnet-c"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = "${aws_vpc.vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
  tags {
    Name = "${var.app_name}-public-rt"
  }
}
resource "aws_route_table_association" "rta-a" {
  subnet_id = "${aws_subnet.public-subnet-a.id}"
  route_table_id = "${aws_route_table.public-rt.id}"
}
resource "aws_route_table_association" "rta-c" {
  subnet_id = "${aws_subnet.public-subnet-c.id}"
  route_table_id = "${aws_route_table.public-rt.id}"
}
