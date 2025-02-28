resource "aws_route53_record" "alb_record" {
  zone_id = "Z00550052ADIVVV2Z3C5Z"  
  name    = "*.fmp.eti.br"
  type    = "A"

  alias {
    name                   = aws_lb.bia.dns_name
    zone_id                = aws_lb.bia.zone_id
    evaluate_target_health = true
  }
}
