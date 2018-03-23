# terraform-aws-cloudtrail [![Build Status](https://travis-ci.org/cloudposse/terraform-aws-cloudtrail.svg?branch=master)](https://travis-ci.org/cloudposse/terraform-aws-cloudtrail)

Setup and manage CloudTrail


## Argument Reference

* `name`: (Required) Name of CloudTrail trail.
* `region`: (Required) AWS region. Used to find remote state.
* `enable_logging`: Enable logging, set to `false` to Pause logging (`default = true`)
* `enable_log_file_validation`: Create signed digest file to validated contents of logs (`default = true`)
* `include_global_service_events`: Include events from global services such as IAM (`default = false`)
* `is_multi_region_trail`: Whether the trail is created in all regions or just the current region (`default = false`)


## Usage
```hcl
module "cloudtrails" {
  source                        = "git::https://github.com/cloudposse/tf_cloudtrail.git?ref=tags/0.1.1"
  name                          = "${var.name}"
  stage                         = "${var.stage}"
  namespace                     = "${var.namespace}"
  enable_logging                = "true"
  enable_log_file_validation    = "true"
  include_global_service_events = "false"
  is_multi_region_trail         = "false"
}
```
