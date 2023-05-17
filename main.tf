provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "demo1" {
  ami           = "ami-09744628bed84e434"
  instance_type = "t2.micro"
}