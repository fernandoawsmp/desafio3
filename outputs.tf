output "instance_name" {
    description = "Public DNS Ec2"
    value = aws_instance.bia_dev.public_dns
}
output "instance_ip" {
    description = "Ip publico da Ec2"
    value = aws_instance.bia_dev.public_ip
}
output "instance_id" {
    description = "Id da Ec2"
    value = aws_instance.bia_dev.id
}
output "instance_type" {
    description = "Tipo da Ec2"
    value = aws_instance.bia_dev.instance_type
}
output "instance_security_groups" {
    description = "SG da Ec2"
    value = aws_instance.bia_dev.security_groups
}
output "instance_public_ip" {
    description = "Ip público da Ec2"
    value = aws_instance.bia_dev.public_ip
}
output "rds_endpoint" {
    description = "Endpoint RDS"
    value = aws_db_instance.bia.endpoint
}
output "rds_arn" {
    description = "Endpoint RDS"
    value = aws_db_instance.bia.arn
}
output "rds_secrets" {
  description = "Secrets associado ao RDS"
  value       = tolist(aws_db_instance.bia.master_user_secret)[0].secret_arn
}

output "bia_repo_url" {
  value = aws_ecr_repository.bia.repository_url
}
  
output "rds_secret_name" {
  description = "Nome do meu segredo"
  value = data.aws_secretsmanager_secret.bia_db.name
}  

output "url_alb" {
  description = "ALB URL"
  value = aws_lb.bia.dns_name
}

output "vpc_id" {
  description ="Vpc ID"
  value = aws_vpc.main.id
}

#output "public_subnets" {
  #value = [aws_subnet.public_a.id, aws_subnet.public_b.id, aws_subnet.public_c.id, aws_subnet.public_d.id]
#}

output "public_subnets_a" {
  value= [aws_subnet.public_a.id]
}

output "public_subnets_b" {
  value= [aws_subnet.public_b.id]
}

output "public_subnets_c" {
  value= [aws_subnet.public_c.id]
}

output "public_subnets_d" {
  value= [aws_subnet.public_d.id]
}

output "private_subnets" {
  value = [aws_subnet.private_a.id, aws_subnet.private_b.id]
}

output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
}

output "ecr_repository_id" {
  value = aws_ecr_repository.bia.repository_url
}

output "aws_acm_certificate"{
  value = aws_acm_certificate.imported_cert.arn
}
