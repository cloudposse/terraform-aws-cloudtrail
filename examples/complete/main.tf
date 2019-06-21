module "cloudtrail" {
  source                        = "git::https://github.com/cloudposse/terraform-aws-cloudtrail.git?ref=master"
  namespace                     = "cp"
  stage                         = "dev"
  name                          = "cluster"
  enable_logging                = "true"
  enable_log_file_validation    = "true"
  include_global_service_events = "true"
  is_multi_region_trail         = "false"
  s3_bucket_name                = "${module.cloudtrail_s3_bucket.bucket_id}"
}

module "cloudtrail_s3_bucket" {
  source    = "git::https://github.com/cloudposse/terraform-aws-cloudtrail-s3-bucket.git?ref=master"
  namespace = "cp"
  stage     = "dev"
  name      = "cluster"
  region    = "us-east-1"
}
