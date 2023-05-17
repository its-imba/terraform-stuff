region         = "eu-west-2"
ami            = "ami-09744628bed84e434"
instance_type  = "t2.micro"
key_name       = "qa-key-15th-may"
public_key_path = "~/qa-key-15th-may.pub"

security_group_name        = "ssh-security-group"
security_group_description = "Allow SSH inbound traffic"
ssh_from_port       = 22
ssh_to_port         = 22
ssh_cidr_block      = "0.0.0.0/0"
