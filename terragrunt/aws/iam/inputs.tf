variable "docdb_username_arn" {
  description = "The ARN of the DocumentDB username SSM parameter"
  type        = string
}

variable "docdb_password_arn" {
  description = "The ARN of the DocumentDB password SSM parameter"
  type        = string
}

variable "jwt_secret_key_arn" {
  description = "The ARN of the JWT secret key SSM parameter"
  type        = string
}

variable "gc_ip_filter_whitelist_arn" {
  description = "The ARN of the GC IP filter allowlist SSM parameter"
  type        = string
}
