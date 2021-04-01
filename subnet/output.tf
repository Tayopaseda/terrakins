output "ec2_id" {
 value = aws_subnet.ec2_subnet.id
}

output "rds_1" {
  value = aws_subnet.rds_sub-1.id
}

output "rds_2" {
  value = aws_subnet.rds_sub-2.id
}
