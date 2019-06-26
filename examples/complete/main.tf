provider "aws" {
  region = var.region
}

module "cloudtrail" {
  source                        = "../../"
  namespace                     = var.namespace
  stage                         = var.stage
  name                          = var.name
  enable_logging                = var.enable_logging
  enable_log_file_validation    = var.enable_log_file_validation
  include_global_service_events = var.include_global_service_events
  is_multi_region_trail         = var.is_multi_region_trail
  is_organization_trail         = var.is_organization_trail
  s3_bucket_name                = module.cloudtrail_s3_bucket.bucket_id
}

module "cloudtrail_s3_bucket" {
  source        = "git::https://github.com/cloudposse/terraform-aws-cloudtrail-s3-bucket.git?ref=tags/0.4.0"
  namespace     = var.namespace
  stage         = var.stage
  name          = var.name
  region        = var.region
  force_destroy = true
}
