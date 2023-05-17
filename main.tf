provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "demo1" {
  ami           = "ami-09744628bed84e434"
  instance_type = "t2.micro"

  tags = {
    Name         = "demo-instance"
    S3_Bucket    = "sam-demo-bucket"
  }
}

resource "aws_s3_bucket" "s3-bucket" {
  bucket = "sam-demo-bucket-01"

  tags = {
    Name         = "sam-demo-bucket"
    Associated_Instance = "demo-instance"
  }
}