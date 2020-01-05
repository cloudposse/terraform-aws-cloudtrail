## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Additional attributes (e.g. `1`) | list(string) | `<list>` | no |
| cloud_watch_logs_group_arn | Specifies a log group name using an Amazon Resource Name (ARN), that represents the log group to which CloudTrail logs will be delivered | string | `` | no |
| cloud_watch_logs_role_arn | Specifies the role for the CloudWatch Logs endpoint to assume to write to a user’s log group | string | `` | no |
| delimiter | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | string | `-` | no |
| enable_log_file_validation | Specifies whether log file integrity validation is enabled. Creates signed digest for validated contents of logs | bool | `true` | no |
| enable_logging | Enable logging for the trail | bool | `true` | no |
| enabled | Set to false to prevent the module from creating any resources | bool | `true` | no |
| environment | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | string | `` | no |
| event_selector | Specifies an event selector for enabling data event logging. See: https://www.terraform.io/docs/providers/aws/r/cloudtrail.html for details on this variable | object | `<list>` | no |
| include_global_service_events | Specifies whether the trail is publishing events from global services such as IAM to the log files | bool | `false` | no |
| is_multi_region_trail | Specifies whether the trail is created in the current region or in all regions | bool | `false` | no |
| is_organization_trail | The trail is an AWS Organizations trail | bool | `false` | no |
| kms_key_arn | Specifies the KMS key ARN to use to encrypt the logs delivered by CloudTrail | string | `` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | string | `` | no |
| namespace | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | string | `` | no |
| s3_bucket_name | S3 bucket name for CloudTrail logs | string | - | yes |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | string | `` | no |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')` | map(string) | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| cloudtrail_arn | The Amazon Resource Name of the trail |
| cloudtrail_home_region | The region in which the trail was created |
| cloudtrail_id | The name of the trail |

