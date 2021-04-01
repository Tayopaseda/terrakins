output "ec2-public-ip" {
  value = module.ec2.public-ip
}

output "rds_address" {
  value = module.rds.address
}
