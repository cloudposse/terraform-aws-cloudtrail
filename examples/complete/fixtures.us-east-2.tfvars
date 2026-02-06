region = "us-east-2"

namespace = "eg"

stage = "test"

name = "cloudtrail-test"

enable_log_file_validation = true

is_multi_region_trail = false

include_global_service_events = false

enable_logging = true

is_organization_trail = false

advanced_event_selector = [
  {
    name = "WriteOnly"
    field_selector = [
      {
        field  = "eventCategory"
        equals = ["Data"]
      },
      {
        field  = "resources.type"
        equals = ["AWS::Lambda::Function"]
      },
      {
        field  = "readOnly"
        equals = ["false"]
    }]
  }
]
