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

