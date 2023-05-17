provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "demo1" {
  ami           = "ami-09744628bed84e434"
  instance_type = "t2.micro"
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "sam-demo-bucket"
}

resource "aws_instance_s3_bucket_association" "demo_bucket_association" {
  bucket      = aws_s3_bucket.demo_bucket.id
  instance_id = aws_instance.demo1.id
}