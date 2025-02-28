resource "aws_instance" "bia_dev" {
  ami           = "ami-05b10e08d247fb927"
  instance_type = "t3.micro"
  tags = {
    ambiente ="dev"
    Name = var.instance_name
  }
  tags_all = {
    Name = var.instance_name
  }
  subnet_id = local.subnet_zona_a
  associate_public_ip_address = true
  ipv6_address_count          = 1
  vpc_security_group_ids = [aws_security_group.bia_dev.id]
  root_block_device {
    volume_size = 13
  }
  iam_instance_profile = aws_iam_role.role_acesso_ssm.name
  user_data = "${file("userdata.sh")}"
  key_name = "fernando-2025"
}