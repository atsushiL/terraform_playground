resource "aws_s3_bucket" "athena" {
  bucket = format("%s-%s-athena-bucket", var.project_name, var.environment)
}

resource "aws_s3_bucket_public_access_block" "athena" {
  bucket                  = aws_s3_bucket.athena.bucket
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_account_public_access_block" "athena" {
  block_public_acls   = false
  block_public_policy = false
}
