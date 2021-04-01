resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = var.vpc

  tags = {
    Name = "ec2_gateway"
  }
}

resource "aws_route_table" "ec2_route_table" {
  vpc_id = var.vpc

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
}

resource "aws_route_table_association" "subnet_route_table" {
  subnet_id = var.ec2_subnet
  route_table_id = aws_route_table.ec2_route_table.id
}
