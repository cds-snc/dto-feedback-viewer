
variable "jwt_secret_key" {
  description = "The secret key used to sign JWT tokens"
  sensitive   = true
  type        = string
}

variable "gc_ip_filter_whitelist" {
  description = "Comma-separated IPs the GC IP filter lets through"
  sensitive   = true
  type        = string
}
