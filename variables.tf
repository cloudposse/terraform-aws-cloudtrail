variable "namespace" {
  description = "Namespace (e.g. `cp` or `cloudposse`)"
  type        = "string"
}

variable "stage" {
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  type        = "string"
}

variable "name" {
  description = "Name  (e.g. `app` or `cluster`)"
  type        = "string"
}

variable "delimiter" {
  type        = "string"
  default     = "-"
  description = "Delimiter to be used between `namespace`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = "list"
  default     = []
  description = "Additional attributes (e.g. `logs`)"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Additional tags (e.g. map('BusinessUnit`,`XYZ`)"
}

variable "acl" {
  type        = "string"
  description = "Canned ACL to apply to the log storage S3 bucket"
  default     = "log-delivery-write"
}

variable "region" {
  type        = "string"
  default     = "us-east-1"
  description = "AWS Region for S3 bucket to store CloudTrail logs"
}

variable "enable_logging" {
  default     = "true"
  description = "Enable logging for the trail"
}

variable "enable_log_file_validation" {
  default     = "true"
  description = "Specifies whether log file integrity validation is enabled. Creates signed digest for validated contents of logs"
}

variable "is_multi_region_trail" {
  default     = "false"
  description = "Specifies whether the trail is created in the current region or in all regions"
}

variable "include_global_service_events" {
  default     = "false"
  description = "Specifies whether the trail is publishing events from global services such as IAM to the log files"
}
