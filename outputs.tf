output "cognito_log_delivery_configurations_log_configurations" {
  description = "Map of log_configurations values across all cognito_log_delivery_configurations, keyed the same as var.cognito_log_delivery_configurations"
  value       = { for k, v in aws_cognito_log_delivery_configuration.cognito_log_delivery_configurations : k => v.log_configurations if v.log_configurations != null && length(v.log_configurations) > 0 }
}
output "cognito_log_delivery_configurations_region" {
  description = "Map of region values across all cognito_log_delivery_configurations, keyed the same as var.cognito_log_delivery_configurations"
  value       = { for k, v in aws_cognito_log_delivery_configuration.cognito_log_delivery_configurations : k => v.region if v.region != null && length(v.region) > 0 }
}
output "cognito_log_delivery_configurations_user_pool_id" {
  description = "Map of user_pool_id values across all cognito_log_delivery_configurations, keyed the same as var.cognito_log_delivery_configurations"
  value       = { for k, v in aws_cognito_log_delivery_configuration.cognito_log_delivery_configurations : k => v.user_pool_id if v.user_pool_id != null && length(v.user_pool_id) > 0 }
}

