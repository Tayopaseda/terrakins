resource "aws_key_pair" "terraformKey" {
  key_name = "terraformKey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCmHVTrQfuuXEIkFHaHKnkcVXVBfQOfK1W/pCfnpvJAfxND8nPcOnMcMphxLqgzsrQZKvYLoUnIMd1oKeUvSde1vbG85LDujOJA+7by7KVHEEjEUGouByzwRluorN5tlK7a+ywEXUVPkH3DYjPK/POrHG2hIV+gxnLk70JONlYKkThyJ13E37q8PWqMa/8WGnqxsVd5kowH9FSbyMmE0OOvDXHG8yqpcTCTeMW0Syu4xs2cB83L8piUKuvWXZAxteUpYOeb8Wnev8shzm4EDjve6zEsWPvS4LYPplhNN4CDiri0TkXYQNdZjAG4YpERNaShS0+D+R2VW8e70hpduWguiQDwKDrDlgjGtunIAIfwGPUYmQAio6P55onYfHzsMaTXH9cZcJHSd3rwk9Np5OuobxBAR/daN1f0zRq8Vaae6QLcMTM1Wx0qaDatu6TMumZBAbD7u99SC0jHIHpQawuPJVwGYRfpTv3w8ugwlJop7BJJunlAClPTEypFLgpyV/8= tayopaseda@jenkins"
}

resource "aws_instance" "ec2-vm" {
  ami = "ami-096cb92bb3580c759"
  instance_type = "t2.micro"
  key_name = "terraformKey"
  associate_public_ip_address = true
  subnet_id = var.ec2_subnet
  security_groups = [var.ec2_sg]
}
