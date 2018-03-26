module "cloudtrail_label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.3.3"
  namespace  = "${var.namespace}"
  stage      = "${var.stage}"
  name       = "${var.name}"
  delimiter  = "${var.delimiter}"
  attributes = "${var.attributes}"
  tags       = "${var.tags}"
}

resource "aws_cloudtrail" "default" {
  name                          = "${module.cloudtrail_label.id}"
  enable_logging                = "${var.enable_logging}"
  s3_bucket_name                = "${var.s3_bucket_name}"
  enable_log_file_validation    = "${var.enable_log_file_validation}"
  is_multi_region_trail         = "${var.is_multi_region_trail}"
  include_global_service_events = "${var.include_global_service_events}"
  tags                          = "${module.cloudtrail_label.tags}"
}
