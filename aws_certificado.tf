resource "aws_acm_certificate" "cert" {
  domain_name       = "bia.fmp.eti.br"
  validation_method = "DNS"  
}

#resource "aws_acm_certificate" "cert" {
#  domain_name       = "bia.fmp.eti.br"
#  validation_method = "DNS"
#
#  subject_alternative_names = ["*.fmp.eti.br"]
#
#  lifecycle {
#    create_before_destroy = true
#  }
#}

#resource "aws_route53_record" "cert_validation" {
#  for_each = {
#    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
#      name  = dvo.resource_record_name
#      type  = dvo.resource_record_type
#      value = dvo.resource_record_value
#    }
#  }

#  zone_id = "Z00550052ADIVVV2Z3C5Z"  # Hosted Zone ID do Route 53
#  name    = each.value.name
#  type    = each.value.type
#  records = [each.value.value]
#  ttl     = 60
#}

#resource "aws_acm_certificate_validation" "cert" {
#  certificate_arn         = aws_acm_certificate.cert.arn
#  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
#}

