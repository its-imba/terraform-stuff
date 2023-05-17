provider "aws" {
  region = var.region
}

resource "aws_vpc" "demo_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = var.public_subnet_1_cidr_block
  availability_zone       = var.public_subnet_1_availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_1_name
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = var.public_subnet_2_cidr_block
  availability_zone       = var.public_subnet_2_availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_2_name
  }
}

resource "aws_internet_gateway" "demo_igw" {
  vpc_id = aws_vpc.demo_vpc.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "demo_route_table" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_igw.id
  }

  tags = {
    Name = var.route_table_name
  }
}

resource "aws_route_table_association" "demo_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.demo_route_table.id
}

resource "aws_route_table_association" "demo_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.demo_route_table.id
}

resource "aws_instance" "demo1" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name      = "demo-instance"
    S3_Bucket = "sam-demo-bucket"
  }

  vpc_security_group_ids = [aws_security_group.ssh_secgroup.id]
}

resource "aws_s3_bucket" "s3-bucket" {
  bucket = "sam-demo-bucket-01"

  tags = {
    Name                = "sam-demo-bucket"
    Associated_Instance = "demo-instance"
  }
}

resource "aws_security_group" "ssh_secgroup" {
  name        = var.security_group_name
  description = var.security_group_description

  ingress {
    from_port   = var.ssh_from_port
    to_port     = var.ssh_to_port
    protocol    = var.security_group_protocol
    cidr_blocks = [var.ssh_cidr_block]
  }
}
