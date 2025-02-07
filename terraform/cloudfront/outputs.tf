output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.app_distribution.id
}

output "cloudfront_distribution_domain" {
  value = aws_cloudfront_distribution.app_distribution.domain_name
}
