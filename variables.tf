variable "mfa_required" {
  type        = "string"
  description = "Require MFA to assume the role"
  default     = true
}

variable "trusted_users" {
  type        = "list"
  description = "List of ARNs of users that are granted to assume the role"
}

variable "role_max_session_duration" {
  type        = "string"
  description = "The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours."
  default     = 3600
}