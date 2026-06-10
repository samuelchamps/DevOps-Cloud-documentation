variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  default = "epicbook-key"
}

variable "ami_id" {
  default = "ami-091138d0f0d41ff90"
}

variable "security_group_name" {
  default = "capstone_sg"
}

variable "vpc_cidr" {
  default = "10.10.0.0/16"
}

variable "subnet_cidr" {
  default = "10.10.1.0/24"
}