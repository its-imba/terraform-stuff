provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "demo1" {
  ami           = "ami-09744628bed84e434"
  instance_type = "t2.micro"

  key_name = aws_key_pair.demo_key.qa-key-15th-may.pem

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

resource "aws_security_group" "ssh_secgroup" {
  name        = "ssh-security-group"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "allow_ssh" {
  security_group_id = aws_security_group.ssh_secgroup.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_key_pair" "demo_key" {
  key_name   = "demo-key"
  public_key = file("/path/to/your/qa-key-15th-may.pem")
}
