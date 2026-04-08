# DATA SOURCES

data "aws_caller_identity" "current" {}

# KMS KEY FOR DYNAMODB

resource "aws_kms_key" "dynamodb" {
  count                   = var.enable_cmk ? 1 : 0
  description             = "KMS CMK for DynamoDB table ${var.table_name}"
  deletion_window_in_days = var.kms_deletion_window
  enable_key_rotation     = true

  tags = {
    Environment = var.tag_Environment
    Managed_By  = var.tag_Managed_By
    Project     = var.tag_Project
    Team        = var.tag_Team
    Owner       = var.tag_Owner
  }
}

resource "aws_kms_alias" "dynamodb" {
  count         = var.enable_cmk ? 1 : 0
  name          = "alias/${var.table_name}"
  target_key_id = aws_kms_key.dynamodb[0].key_id
}

# DYNAMODB TABLE

resource "aws_dynamodb_table" "this" {
  name         = var.table_name
  billing_mode = var.billing_mode
  hash_key     = var.hash_key

  attribute {
    name = var.hash_key
    type = "S"
  }

  point_in_time_recovery {
    enabled = var.enable_pitr
  }

  server_side_encryption {
    enabled     = true
    kms_key_arn = var.enable_cmk ? aws_kms_key.dynamodb[0].arn : null
  }

  tags = {
    Environment = var.tag_Environment
    Managed_By  = var.tag_Managed_By
    Project     = var.tag_Project
    Team        = var.tag_Team
    Owner       = var.tag_Owner
  }
}

data "aws_caller_identity" "current" {}

# KMS KEY FOR DYNAMODB

resource "aws_kms_key" "dynamodb" {
  count                   = var.enable_cmk ? 1 : 0
  description             = "KMS CMK for DynamoDB table ${var.table_name}"
  deletion_window_in_days = var.kms_deletion_window
  enable_key_rotation     = true

  tags = {
    Environment = var.tag_Environment
    Managed_By  = var.tag_Managed_By
    Project     = var.tag_Project
    Team        = var.tag_Team
    Owner       = var.tag_Owner
  }
}

resource "aws_kms_alias" "dynamodb" {
  count         = var.enable_cmk ? 1 : 0
  name          = "alias/${var.table_name}"
  target_key_id = aws_kms_key.dynamodb[0].key_id
}

# DYNAMODB TABLE

resource "aws_dynamodb_table" "this" {
  name         = var.table_name
  billing_mode = var.billing_mode
  hash_key     = var.hash_key

  attribute {
    name = var.hash_key
    type = "S"
  }

  point_in_time_recovery {
    enabled = var.enable_pitr
  }

  server_side_encryption {
    enabled     = true
    kms_key_arn = var.enable_cmk ? aws_kms_key.dynamodb[0].arn : null
  }

  tags = {
    Environment = var.tag_Environment
    Managed_By  = var.tag_Managed_By
    Project     = var.tag_Project
    Team        = var.tag_Team
    Owner       = var.tag_Owner
  }
}