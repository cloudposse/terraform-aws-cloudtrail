variable "region" {
  type        = string
  description = "AWS region"
}

variable "enable_log_file_validation" {
  type        = bool
  description = "Specifies whether log file integrity validation is enabled. Creates signed digest for validated contents of logs"
}

variable "is_multi_region_trail" {
  type        = bool
  description = "Specifies whether the trail is created in the current region or in all regions"
}

variable "include_global_service_events" {
  type        = bool
  description = "Specifies whether the trail is publishing events from global services such as IAM to the log files"
}

variable "enable_logging" {
  type        = bool
  description = "Enable logging for the trail"
}

variable "is_organization_trail" {
  type        = bool
  description = "The trail is an AWS Organizations trail"
}
