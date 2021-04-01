resource "aws_db_subnet_group" "subnet-group" {
  name = "rds-subnet-group"
  subnet_ids = [var.sub_id_1, var.sub_id_2]

  tags = {
    name = "My database subnet group"
  }
}

resource "aws_db_instance" "rds" {
  allocated_storage = 20
  engine = "mysql"
  instance_class = "db.t2.micro"
  name = "mydb"
  username = var.username
  password = var.password
  db_subnet_group_name = aws_db_subnet_group.subnet-group.id
  vpc_security_group_ids = [var.sg]
  skip_final_snapshot = true
}
