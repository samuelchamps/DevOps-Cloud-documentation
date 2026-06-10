resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_pair
  tags = {
    Name = var.server_name
  }
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
}

resource "aws_vpc" "my_main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.my_main.id
  cidr_block        = "172.16.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }
}
resource "aws_security_group" "web_sg" {
  name        = var.security_group_name
  description = "Allow HTTP and SSH traffic"
  vpc_id      = aws_vpc.my_main.id

ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
ingress {
    from_port   = 22
    to_port     = 22
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
    Name = var.security_group_name
  }
}
resource "aws_internet_gateway" "clearview_igw" {
    vpc_id = aws_vpc.my_main.id
    tags = {
    Name = "clearview-igw"
}
}
resource "aws_route_table" "clearview_rt" {
    vpc_id = aws_vpc.my_main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.clearview_igw.id
    }
    tags = {
        Name = "clearview-rt"
    }
}
resource "aws_route_table_association" "public_subnet_association" {
    subnet_id      = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.clearview_rt.id
}   