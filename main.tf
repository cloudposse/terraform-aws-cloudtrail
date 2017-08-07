module "tf_label" {
  source    = "../tf_label"
  namespace = "${var.namespace}"
  stage     = "${var.stage}"
  name      = "${var.name}"
}

resource "aws_cloudtrail" "ct" {
  name                          = "${module.tf_label.id}"
  s3_bucket_name                = "${aws_s3_bucket.cloud_trail.id}"
  enable_logging                = "${var.enable_logging}"
  enable_log_file_validation    = "${var.enable_log_file_validation}"
  is_multi_region_trail         = "${var.is_multi_region_trail}"
  include_global_service_events = "${var.include_global_service_events}"
}

resource "aws_s3_bucket" "cloud_trail" {
  bucket        = "${module.tf_label.id}"
  force_destroy = false

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::${module.tf_label.id}"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${module.tf_label.id}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
}
