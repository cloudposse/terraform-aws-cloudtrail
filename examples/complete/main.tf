provider "aws" {
  region = var.region
}

module "cloudtrail" {
  source  = "../../"
  enabled = module.this.enabled

  enable_logging                = var.enable_logging
  enable_log_file_validation    = var.enable_log_file_validation
  include_global_service_events = var.include_global_service_events
  is_multi_region_trail         = var.is_multi_region_trail
  is_organization_trail         = var.is_organization_trail
  s3_bucket_name                = module.cloudtrail_s3_bucket.bucket_id

  context = module.this.context
}

module "cloudtrail_s3_bucket" {
  source  = "git::https://github.com/cloudposse/terraform-aws-cloudtrail-s3-bucket.git?ref=tags/0.12.0"
  enabled = module.this.enabled

  force_destroy = true

  context = module.this.context
}
