// This will build an S3 Bucket & DynamoDB Table for TFState Storage and Terraform State Locking
resource "aws_s3_bucket" "Terraform_Remote_State_S3_Bucket" {
    bucket = ""
    versioning {
      enabled = true
    }
    lifecycle {
      prevent_destroy = true
    }
    server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }
    tags {
      Name = "S3 Remote Terraform State Store"
    }      
}
resource "aws_dynamodb_table" "Terraform_Remote_State_Lock_DynamoDB_Table" {
  name = ""
  hash_key = "LockID"
  read_capacity = 5
  write_capacity = 5
  attribute {
    name = "LockID"
    type = "S"
  }
  tags {
    Name = "DynamoDB Terraform State Lock Table"
  }
}