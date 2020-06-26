resource "aws_s3_bucket" "data-lake" {
  bucket = "${var.project}-data-lake"
  acl    = "private"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = "${var.project}-data-lake"
    Description = "Remote state bucket"
    Owner       = "adam.dewberry"
  }
}

resource "aws_s3_bucket_public_access_block" "block_public_access_to_data-lake" {
  bucket = aws_s3_bucket.data-lake.id

  block_public_acls   = true
  block_public_policy = true
}