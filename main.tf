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
}

resource "aws_s3_bucket" "s3-bucket" {
  bucket = "sam-demo-bucket-01"

  tags = {
    Name                = "sam-demo-bucket"
    Associated_Instance = "demo-instance"
  }
}
