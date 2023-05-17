variable "region" {
  description = "AWS region"
  type        = string
}

variable "ami" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Name of the key pair"
  type        = string
}

variable "public_key_path" {
  description = "Path to the public key file"
  type        = string
  default     = "~/qa-key-15th-may.pub"
}


variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "sam-demo-bucket"
}
variable "security_group_name" {
  description = "Name of the SSH security group"
  type        = string
}

variable "security_group_description" {
  description = "Description of the SSH security group"
  type        = string
}

variable "ssh_from_port" {
  description = "Start of the port range for the SSH security group"
  type        = number
}

variable "ssh_to_port" {
  description = "End of the port range for the SSH security group"
  type        = number
}

variable "security_group_protocol" {
  description = "Protocol for the SSH security group"
  type        = string
}

variable "ssh_cidr_block" {
  description = "CIDR blocks for the SSH security group"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
}

variable "vpc_name" {
  description = "Name of the VPC"
}

variable "public_subnet_1_cidr_block" {
  description = "CIDR block for public subnet 1"
}

variable "public_subnet_1_availability_zone" {
  description = "Availability zone for public subnet 1"
}

variable "public_subnet_1_name" {
  description = "Name of public subnet 1"
}

variable "public_subnet_2_cidr_block" {
  description = "CIDR block for public subnet 2"
}

variable "public_subnet_2_availability_zone" {
  description = "Availability zone for public subnet 2"
}

variable "public_subnet_2_name" {
  description = "Name of public subnet 2"
}

variable "igw_name" {
  description = "Name of the Internet Gateway"
}

variable "route_table_name" {
  description = "Name of the route table"
}