# tf_cloudtrail

Setup and manage CloudTrail

### Variables

#### Required

* name: Name of CloudTrail trail.
* region: AWS region. Used to find remote state.



#### Optional

* enable_logging: Enable logging, set to 'false' to Pause logging (default = true)
* enable_log_file_validation: Create signed digest file to validated contents of logs (default = true)
* include_global_service_events: Include evnets from global services such as IAM (default = false)
* is_multi_region_trail: Whether the trail is created in all regions or just the current region (default = false)

## Usage
```
module "ct" {
  source = "github.com/cloudposse/tf_cloudtrail"
  name = "${var.name}"
  stage = "${var.stage}"
  namespace = "${var.namespace}"
  enable_logging = "true"
  enable_log_file_validation = "true"
  include_global_service_events = "false"
  is_multi_region_trail = "false"
}
```
