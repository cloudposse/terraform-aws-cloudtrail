output "cloudtrail_id" {
  value       = join("", aws_cloudtrail.default[*].id)
  description = "The ID of the trail. (Name for provider < v5, ARN for provider >= v5)."
}

output "cloudtrail_home_region" {
  value       = join("", aws_cloudtrail.default[*].home_region)
  description = "The region in which the trail was created"
}

output "cloudtrail_arn" {
  value       = join("", aws_cloudtrail.default[*].arn)
  description = "The Amazon Resource Name of the trail"
}
