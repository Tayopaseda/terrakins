resource "aws_vpc" "our_vpc" {
  cidr_block = "120.1.0.0/16"

  tags = {
    Name = "our_vpc"
  }
}
