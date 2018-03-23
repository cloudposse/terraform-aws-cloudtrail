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
  s3_bucket_name                = "${module.s3_log_storage.bucket_id}"
  enable_logging                = "${var.enable_logging}"
  enable_log_file_validation    = "${var.enable_log_file_validation}"
  is_multi_region_trail         = "${var.is_multi_region_trail}"
  include_global_service_events = "${var.include_global_service_events}"
  tags                          = "${module.cloudtrail_label.tags}"
}

data "aws_iam_policy_document" "default" {
  statement {
    sid = "AWSCloudTrailAclCheck"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions = [
      "s3:GetBucketAcl",
    ]

    resources = [
      "arn:aws:s3:::${module.cloudtrail_label.id}",
    ]
  }

  statement {
    sid = "AWSCloudTrailWrite"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::${module.cloudtrail_label.id}/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"

      values = [
        "bucket-owner-full-control",
      ]
    }
  }
}

# https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html
module "s3_log_storage" {
  source                 = "git::https://github.com/cloudposse/terraform-aws-s3-log-storage.git?ref=tags/0.2.0"
  namespace              = "${var.namespace}"
  stage                  = "${var.stage}"
  name                   = "${var.name}"
  region                 = "${var.region}"
  acl                    = "${var.acl}"
  policy                 = "${data.aws_iam_policy_document.default.json}"
  force_destroy          = "false"
  versioning_enabled     = "true"
  lifecycle_rule_enabled = "false"
  delimiter              = "${var.delimiter}"
  attributes             = ["${compact(concat(var.attributes, list("cloudtrail", "logs")))}"]
  tags                   = "${var.tags}"
}
