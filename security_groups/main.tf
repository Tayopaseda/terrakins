resource "aws_security_group" "rds" {
  name = "rds_security_group"
  description = "rds security group"
  vpc_id = var.vpc

  ingress {
    description = "Allow inbound mysql connection to from subnet only"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["120.1.1.0/24"]
  }

  egress {
    description = "Allow outbound mysql connection to ec2 subnet only"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["120.1.1.0/24"]
  }
}


resource "aws_security_group" "ec2" {
  name = "ec2_security_group"
  description = "security group for ec2 instances"
  vpc_id = var.vpc

  ingress {
    description = "Allow ssh connection for all vms in ec2 subnet"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["120.1.1.0/24"]
  }

  ingress {
    description = "Allow mysql connection from rds"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = [aws_security_group.rds.id]
  }

  ingress {
    description = "Allow connection from gcp"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["34.105.222.167/32"]
  }

  egress {
    description = "Allow all outbound connections"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

