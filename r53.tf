# This creates CNAME record for mongodb

resource "aws_route53_record" "www" {
  zone_id = data.terraform_remote_state.vpc.outputs.PRIVATE_HOSTED_ZONE_ID
  name    = "mongodb-${var.ENV}-data.terraform_remote_state.vpc.outputs.PRIVATE_HOSTED_ZONE_NAME"
  type    = "CNAME"
  ttl     = 10
  records = [aws_docdb_cluster.docdb.endpoint]
}

# A record : Creating name to an IP add
# C record : Creating name to name