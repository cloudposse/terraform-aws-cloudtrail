variable "region" {
  default = ""
}

variable "name" {
  default = ""
}

variable "namespace" {
  default = ""
}

variable "stage" {
  default = ""
}

variable "enable_logging" {
  default = "true"
}

variable "enable_log_file_validation" {
  default = "true"
}

variable "is_multi_region_trail" {
  default = "false"
}

variable "include_global_service_events" {
  default = "false"
}
