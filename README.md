# terraform-aws-cloudtrail [![Build Status](https://travis-ci.org/cloudposse/terraform-aws-cloudtrail.svg?branch=master)](https://travis-ci.org/cloudposse/terraform-aws-cloudtrail)

Terraform module to provision an AWS [CloudTrail](https://aws.amazon.com/cloudtrail/)

The module accepts an encrypted S3 bucket with versioning to store CloudTrail logs.

The bucket could be from the same ASW account or from a different account.

This is useful if an organization uses a number of separate AWS accounts to isolate the Audit environment from other environments (production, staging, development).

In this case, you create CloudTrail in the production environment (production AWS account), 
while the S3 bucket to store the CloudTrail logs is created in the Audit AWS account, restricting access to the logs only to the users/groups from the Audit account.


## Usage

```hcl
module "cloudtrail" {
  source                        = "git::https://github.com/cloudposse/terraform-aws-cloudtrail.git?ref=master"
  namespace                     = "cp"
  stage                         = "prod"
  name                          = "cluster"
  enable_log_file_validation    = "true"
  include_global_service_events = "false"
  is_multi_region_trail         = "false"
  enable_logging                = "true"
  s3_bucket_name                = "my-cloudtrail-logs-bucket"
}
```

## Variables

|  Name                            |  Default             |  Description                                                                                       | Required |
|:---------------------------------|:--------------------:|:---------------------------------------------------------------------------------------------------|:--------:|
| `namespace`                      | ``                   | Namespace (e.g. `cp` or `cloudposse`)                                                              | Yes      |
| `stage`                          | ``                   | Stage (e.g. `prod`, `dev`, `staging`)                                                              | Yes      |
| `name`                           | ``                   | Name  (e.g. `cluster` or `app`)                                                                    | Yes      |
| `attributes`                     | `[]`                 | Additional attributes (e.g. `logs`)                                                                | No       |
| `tags`                           | `{}`                 | Additional tags  (e.g. `map("BusinessUnit","XYZ")`                                                 | No       |
| `delimiter`                      | `-`                  | Delimiter to be used between `namespace`, `stage`, `name` and `attributes`                         | No       |
| `enable_log_file_validation`     | `true`               | Specifies whether log file integrity validation is enabled. Creates signed digest for validated contents of logs    | No       |
| `include_global_service_events`  | `false`              | Specifies whether the trail is publishing events from global services such as IAM to the log files | No       |
| `is_multi_region_trail`          | `false`              | Specifies whether the trail is created in the current region or in all regions                     | No       |
| `enable_logging`                 | `true`               | Enable logging for the trail. Logs will be stored in the S3 bucket                                 | No       |
| `s3_bucket_name`                 | ``                   | S3 bucket name for CloudTrail logs                                                                 | Yes (if `enable_logging`=`true`)  |


## Outputs

| Name                      | Description                                  |
|:--------------------------|:---------------------------------------------|
| `cloudtrail_id`           | The name of the trail                        |
| `cloudtrail_home_region`  | The region in which the trail was created    |
| `cloudtrail_arn`          | The Amazon Resource Name of the trail        |



## Help

**Got a question?**

File a GitHub [issue](https://github.com/cloudposse/terraform-aws-cloudtrail/issues), send us an [email](mailto:hello@cloudposse.com) or reach out to us on [Gitter](https://gitter.im/cloudposse/).


## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/cloudposse/terraform-aws-cloudtrail/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing `terraform-aws-cloudtrail`, we would love to hear from you! Shoot us an [email](mailto:hello@cloudposse.com).

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull request** so that we can review your changes

**NOTE:** Be sure to merge the latest from "upstream" before making a pull request!


## License

[APACHE 2.0](LICENSE) © 2018 [Cloud Posse, LLC](https://cloudposse.com)

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.


## About

`terraform-aws-cloudtrail` is maintained and funded by [Cloud Posse, LLC][website].

![Cloud Posse](https://cloudposse.com/logo-300x69.png)


Like it? Please let us know at <hello@cloudposse.com>

We love [Open Source Software](https://github.com/cloudposse/)!

See [our other projects][community]
or [hire us][hire] to help build your next cloud platform.

  [website]: https://cloudposse.com/
  [community]: https://github.com/cloudposse/
  [hire]: https://cloudposse.com/contact/


### Contributors

| [![Erik Osterman][erik_img]][erik_web]<br/>[Erik Osterman][erik_web] | [![Andriy Knysh][andriy_img]][andriy_web]<br/>[Andriy Knysh][andriy_web] |
|-------------------------------------------------------|------------------------------------------------------------------|

  [erik_img]: http://s.gravatar.com/avatar/88c480d4f73b813904e00a5695a454cb?s=144
  [erik_web]: https://github.com/osterman/
  [andriy_img]: https://avatars0.githubusercontent.com/u/7356997?v=4&u=ed9ce1c9151d552d985bdf5546772e14ef7ab617&s=144
  [andriy_web]: https://github.com/aknysh/
