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
    value = aws_db_instance.databia.endpoint
}
output "rds_arn" {
    description = "Endpoint RDS"
    value = aws_db_instance.databia.arn
}