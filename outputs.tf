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

output "aws_acm_certificate" {
  description = "ARN fo meu certificado"
  value = aws_acm_certificate.cert.arn
}  

output "url_alb" {
  description = "ALB URL"
  value = aws_lb.bia.dns_name
}