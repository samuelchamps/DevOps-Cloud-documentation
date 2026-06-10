resource "aws_instance" "web" {
  ami = "ami-091138d0f0d41ff90"
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  tags = {
    Name = "WebServer"
  }
}

resource "aws_vpc" "first_vpc" {
  cidr_block = "172.16.0.0/16"
  tags = {
    Name = "FirstVPC"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id = aws_vpc.first_vpc.id
  cidr_block = "172.16.1.0/24"
  tags = {
    Name = "Subnet2"
  }
}