output "cloudtrail_id" {
  value       = module.cloudtrail.cloudtrail_id
  description = "The name of the trail"
}

output "cloudtrail_home_region" {
  value       = module.cloudtrail.cloudtrail_home_region
  description = "The region in which the trail was created"
}

output "cloudtrail_arn" {
  value       = module.cloudtrail.cloudtrail_arn
  description = "The Amazon Resource Name of the trail"
}

output "cloudtrail_bucket_domain_name" {
  value       = module.cloudtrail_s3_bucket.bucket_domain_name
  description = "FQDN of the CloudTral S3 bucket"
}

output "cloudtrail_bucket_id" {
  value       = module.cloudtrail_s3_bucket.bucket_id
  description = "Name of the CloudTral S3 bucket"
}

output "cloudtrail_bucket_arn" {
  value       = module.cloudtrail_s3_bucket.bucket_arn
  description = "ARN of the CloudTral S3 bucket"
}
