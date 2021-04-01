resource "aws_subnet" "ec2_subnet" {
  vpc_id = var.id
  cidr_block = "120.1.1.0/24"

  tags = {
    name = "ec2_subnet"
  }
}

resource "aws_subnet" "rds_sub-1" {
  vpc_id = var.id
  cidr_block = "120.1.2.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    name = "rds_sub-1"
  }
}

resource "aws_subnet" "rds_sub-2" {
  vpc_id = var.id
  cidr_block = "120.1.3.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    name = "rds_sub-2"
  }
}
