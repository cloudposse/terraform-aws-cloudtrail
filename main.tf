module "cloudtrail_label" {
  source     = "git::https://github.com/cloudposse/terraform-terraform-label.git?ref=tags/0.1.2"
  enabled    = var.enabled
  namespace  = var.namespace
  stage      = var.stage
  name       = var.name
  delimiter  = var.delimiter
  attributes = var.attributes
  tags       = var.tags
}

resource "aws_cloudtrail" "default" {
  name                          = module.cloudtrail_label.id
  count                         = var.enabled == true ? 1 : 0
  enable_logging                = var.enable_logging
  s3_bucket_name                = var.s3_bucket_name
  enable_log_file_validation    = var.enable_log_file_validation
  is_multi_region_trail         = var.is_multi_region_trail
  include_global_service_events = var.include_global_service_events
  cloud_watch_logs_role_arn     = var.cloud_watch_logs_role_arn
  cloud_watch_logs_group_arn    = var.cloud_watch_logs_group_arn
  tags                          = module.cloudtrail_label.tags
  dynamic "event_selector" {
    for_each = var.event_selector
    content {

      include_management_events = lookup(event_selector.value, "include_management_events", null)
      read_write_type           = lookup(event_selector.value, "read_write_type", null)

      dynamic "data_resource" {
        for_each = lookup(event_selector.value, "data_resource", [])
        content {
          type   = data_resource.value.type
          values = data_resource.value.values
        }
      }
    }
  }
  kms_key_id            = var.kms_key_id
  is_organization_trail = var.is_organization_trail
}
