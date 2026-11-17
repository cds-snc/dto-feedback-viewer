# DocumentDB credentials are managed in dto-feedback-cj repo
# Reference them via env_vars.hcl: dto_feedback_cj_docdb_username_arn and dto_feedback_cj_docdb_password_arn

resource "aws_ssm_parameter" "jwt_secret_key" {
  provider = aws.core_services
  name     = "/feedback-viewer/staging/jwt_secret_key"
  type     = "SecureString"
  value    = var.jwt_secret_key

  tags = {
    CostCentre = var.billing_code
    Terraform  = true
  }
}

resource "aws_ssm_parameter" "gc_ip_filter_whitelist" {
  provider = aws.core_services
  name     = "/feedback-viewer/staging/gc_ip_filter_whitelist"
  type     = "SecureString"
  value    = var.gc_ip_filter_whitelist

  tags = {
    CostCentre = var.billing_code
    Terraform  = true
  }
}
