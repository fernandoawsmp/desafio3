resource "aws_acm_certificate" "imported_cert" {
  domain_name       = "*.fmp.eti.br"
  validation_method = "DNS"  
}
