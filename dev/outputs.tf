# OUTPUTS

output "table_name" {
  description = "DynamoDB table name"
  value       = aws_dynamodb_table.this.name
}

output "table_arn" {
  description = "DynamoDB table ARN"
  value       = aws_dynamodb_table.this.arn
}

output "kms_key_arn" {
  description = "KMS key ARN used for DynamoDB encryption"
  value       = var.enable_cmk ? aws_kms_key.dynamodb[0].arn : null
}