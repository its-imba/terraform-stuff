region         = "eu-west-2"
ami            = "ami-09744628bed84e434"
instance_type  = "t2.micro"
key_name       = "demo_key"
public_key_path = "~/qa-key-15th-may.pem"

ssh_security_group_name        = "ssh-security-group"
ssh_security_group_description = "Allow SSH inbound traffic"
ssh_security_group_from_port   = 22
ssh_security_group_to_port     = 22
ssh_security_group_protocol    = "tcp"
ssh_security_group_cidr_blocks = ["0.0.0.0/0"]
