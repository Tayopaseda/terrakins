output "rds" {
  value = aws_security_group.rds.id
}

output "ec2" {
  value = aws_security_group.ec2.id
}
