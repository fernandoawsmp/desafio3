#locals {
#  vpc_id="vpc-0e3c0d174396117bc"
#  subnet_zona_a="subnet-0b0bc3244d9ea3a1b"
#  subnet_zona_b="subnet-0c8e845cad6057887"
#  subnet_zona_d="subnet-02fcfa0d640ce1a23"
#}

locals {
  vpc_id         = aws_vpc.main.id
  #public_subnets = [aws_subnet.public_a.id, aws_subnet.public_b.id, aws_subnet.public_c.id, aws_subnet.public_d.id]
  subnet_zona_a =aws_subnet.public_a.id
  subnet_zona_b =aws_subnet.public_b.id
  subnet_zona_c =aws_subnet.public_c.id
  subnet_zona_d =aws_subnet.public_d.id
  #private_subnets = [aws_subnet.private_a.id, aws_subnet.private_b.id]
  private_a =aws_subnet.private_a.id
  private_b =aws_subnet.private_b.id
}
