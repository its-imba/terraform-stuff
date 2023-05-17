provider "aws" {
  region = var.region
}

resource "aws_key_pair" "demo_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_instance" "demo1" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

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
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr_block]
  }
}
