resource "aws_route53_zone" "main" {
  name = "DevDomain.com"
}

resource "aws_route53_record" "webapp" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "webapp.DevDomain.com"
  type    = "A"
  alias {
    name                   = aws_lb.webapp.dns_name
    zone_id                = aws_lb.webapp.zone_id
    evaluate_target_health = true
  }
}

