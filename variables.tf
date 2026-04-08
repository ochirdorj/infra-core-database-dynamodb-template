# DYNAMODB VARIABLES

variable "table_name" {
  type        = string
  description = "Name of the DynamoDB table"
}

variable "billing_mode" {
  type        = string
  description = "PAY_PER_REQUEST or PROVISIONED"
  default     = "PAY_PER_REQUEST"
}

variable "hash_key" {
  type        = string
  description = "Hash key for the DynamoDB table"
  default     = "LockID"
}

variable "enable_pitr" {
  type        = bool
  description = "Enable point in time recovery"
  default     = true
}

variable "enable_cmk" {
  type        = bool
  description = "Enable Customer Managed KMS key encryption"
  default     = true
}

variable "kms_deletion_window" {
  type        = number
  description = "KMS key deletion window in days"
  default     = 7
}

# TAGSi

variable "tag_Environment" {
  type        = string
  description = "Environment"
}

variable "tag_Managed_By" {
  type        = string
  description = "Name of the tool"
}

variable "tag_Project" {
  type        = string
  description = "Project name"
}

variable "tag_Team" {
  type        = string
  description = "Team"
}

variable "tag_Owner" {
  type        = string
  description = "Owner"
}