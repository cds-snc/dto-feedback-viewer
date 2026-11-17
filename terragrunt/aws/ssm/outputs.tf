output "jwt_secret_key_arn" {
  description = "The SSM parameter ARN for the JWT secret key"
  value       = aws_ssm_parameter.jwt_secret_key.arn
}

output "gc_ip_filter_whitelist_arn" {
  description = "The SSM parameter ARN for the GC IP filter allowlist"
  value       = aws_ssm_parameter.gc_ip_filter_whitelist.arn
}
