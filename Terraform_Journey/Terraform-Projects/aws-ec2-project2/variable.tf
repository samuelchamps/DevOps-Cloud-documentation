variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
  default     = "subnet-022d342ca7cfad91c"
}