# =========================
# VPC
# =========================
resource "aws_vpc" "capstone_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "capstone_vpc"
  }
}

# =========================
# Internet Gateway
# =========================
resource "aws_internet_gateway" "capstone_igw" {
  vpc_id = aws_vpc.capstone_vpc.id

  tags = {
    Name = "capstone_igw"
  }
}

# =========================
# Public Subnet
# =========================
resource "aws_subnet" "capstone_subnet" {
  vpc_id                  = aws_vpc.capstone_vpc.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "capstone_subnet"
  }
}

# =========================
# Route Table
# =========================
resource "aws_route_table" "capstone_rt" {
  vpc_id = aws_vpc.capstone_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.capstone_igw.id
  }

  tags = {
    Name = "capstone_rt"
  }
}

# =========================
# Route Table Association
# =========================
resource "aws_route_table_association" "capstone_rta" {
  subnet_id      = aws_subnet.capstone_subnet.id
  route_table_id = aws_route_table.capstone_rt.id
}

# =========================
# Security Group
# =========================
resource "aws_security_group" "capstone_sg" {
  name        = var.security_group_name
  description = "Security group for capstone project"
  vpc_id      = aws_vpc.capstone_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "capstone_sg"
  }
}

# =========================
# EC2 Instance
# =========================
resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.capstone_subnet.id
  vpc_security_group_ids      = [aws_security_group.capstone_sg.id]
  associate_public_ip_address = true
  key_name                    = var.key_name
  user_data                   = file("user_data.sh")

  tags = {
    Name = "WebServer"
  }
}