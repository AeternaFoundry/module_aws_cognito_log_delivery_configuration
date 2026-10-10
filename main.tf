resource "aws_cognito_log_delivery_configuration" "cognito_log_delivery_configurations" {
  for_each = var.cognito_log_delivery_configurations

  user_pool_id = each.value.user_pool_id
  region       = each.value.region

  dynamic "log_configurations" {
    for_each = each.value.log_configurations != null ? each.value.log_configurations : []
    content {
      dynamic "cloud_watch_logs_configuration" {
        for_each = log_configurations.value.cloud_watch_logs_configuration != null ? log_configurations.value.cloud_watch_logs_configuration : []
        content {
          log_group_arn = cloud_watch_logs_configuration.value.log_group_arn
        }
      }
      event_source = log_configurations.value.event_source
      dynamic "firehose_configuration" {
        for_each = log_configurations.value.firehose_configuration != null ? log_configurations.value.firehose_configuration : []
        content {
          stream_arn = firehose_configuration.value.stream_arn
        }
      }
      log_level = log_configurations.value.log_level
      dynamic "s3_configuration" {
        for_each = log_configurations.value.s3_configuration != null ? log_configurations.value.s3_configuration : []
        content {
          bucket_arn = s3_configuration.value.bucket_arn
        }
      }
    }
  }
}

