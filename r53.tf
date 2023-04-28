# This creates CNAME record for mongodb

resource "aws_route53_record" "www" {
  zone_id = "Z03162902ZBUWVJLMZQNI"
  name    = "www.example.com"
  type    = "A"
  ttl     = 300
  records = [aws_eip.lb.public_ip]
}