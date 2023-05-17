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
security_group_protocol = "tcp"

vpc_cidr_block          = "10.0.0.0/16"
vpc_name                = "demo-vpc"
public_subnet_1_cidr_block              = "10.0.1.0/24"
public_subnet_1_availability_zone       = "eu-west-2a"
public_subnet_1_name    = "public-subnet-1"
public_subnet_2_cidr_block              = "10.0.2.0/24"
public_subnet_2_availability_zone       = "eu-west-2b"
public_subnet_2_name    = "public-subnet-2"
igw_name                = "demo-igw"
route_table_name        = "demo-route-table"
