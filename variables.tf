variable "cognito_log_delivery_configurations" {
  description = <<EOT
Map of cognito_log_delivery_configurations, attributes below
Required:
    - user_pool_id
Optional:
    - region
    - log_configurations (block):
        - cloud_watch_logs_configuration (optional, block):
            - log_group_arn (optional)
        - event_source (required)
        - firehose_configuration (optional, block):
            - stream_arn (optional)
        - log_level (required)
        - s3_configuration (optional, block):
            - bucket_arn (optional)
EOT

  type = map(object({
    user_pool_id = string
    region       = optional(string)
    log_configurations = optional(list(object({
      cloud_watch_logs_configuration = optional(list(object({
        log_group_arn = optional(string)
      })))
      event_source = string
      firehose_configuration = optional(list(object({
        stream_arn = optional(string)
      })))
      log_level = string
      s3_configuration = optional(list(object({
        bucket_arn = optional(string)
      })))
    })))
  }))
}

