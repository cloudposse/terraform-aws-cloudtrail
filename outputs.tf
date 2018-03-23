output "bucket_name" {
  value = "${module.s3_log_storage.bucket_id}"
}

output "cloudtrail_id" {
  value = "${aws_cloudtrail.default.id}"
}

output "cloudtrail_home_region" {
  value = "${aws_cloudtrail.default.home_region}"
}

output "cloudtrail_arn" {
  value = "${aws_cloudtrail.default.arn}"
}
