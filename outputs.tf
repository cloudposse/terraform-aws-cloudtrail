output "cloudtrail_id" {
  value = "${aws_cloudtrail.default.id}"
}

output "cloudtrail_home_region" {
  value = "${aws_cloudtrail.default.home_region}"
}

output "cloudtrail_arn" {
  value = "${aws_cloudtrail.default.arn}"
}
