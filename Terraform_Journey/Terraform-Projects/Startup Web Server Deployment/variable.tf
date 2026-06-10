variable "instance_type" {
  description = "The type of instance to use for the web server"
  default     = "t3.micro"
  
}
variable "key_pair" {
  description = "key pair"
  default = "ansible-key"
}
variable "ami_id" {
  description = "The AMI ID to use for the web server"
  default     = "ami-0c94855ba95c71c99"

}
variable "vpc_name" {
  description = "The name of the VPC"
  default     = "clearview-vpc"
}
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "172.16.0.0/16"
}
variable "server_name" {
  description = "The name of the web server"
  default     = "Startup Web Server"
}
variable "security_group_name" {
  description = "The name of the security group"
  default     = "clearview-web-sg"
}
