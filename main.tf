resource "random_id" "bucket_suffix" {
  count       = length(var.regions)
  byte_length = 4
}

# Bucket dla us-east-1 (domyślny provider)
resource "aws_s3_bucket" "buckets" {
  provider = aws

  count  = 1

  bucket = "${var.bucket_name_prefix}-${var.regions[0]}-${random_id.bucket_suffix[0].hex}"
}

resource "aws_s3_bucket_versioning" "buckets_versioning" {
  provider = aws

  count  = 1

  bucket = aws_s3_bucket.buckets[0].id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "buckets_lifecycle" {
  provider = aws

  count  = 1

  bucket = aws_s3_bucket.buckets[0].id

  rule {
    id     = "transition-to-glacier"
    status = "Enabled"

    transition {
      days          = 90
      storage_class = "GLACIER_IR"
    }
  }
}

# Bucket dla us-west-2 (aliasowany provider)
resource "aws_s3_bucket" "buckets_west" {
  provider = aws.us_west_2

  count  = 1

  bucket = "${var.bucket_name_prefix}-${var.regions[1]}-${random_id.bucket_suffix[1].hex}"
}

resource "aws_s3_bucket_versioning" "buckets_versioning_west" {
  provider = aws.us_west_2

  count  = 1

  bucket = aws_s3_bucket.buckets_west[0].id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "buckets_lifecycle_west" {
  provider = aws.us_west_2

  count  = 1

  bucket = aws_s3_bucket.buckets_west[0].id

  rule {
    id     = "transition-to-glacier"
    status = "Enabled"

    transition {
      days          = 90
      storage_class = "GLACIER_IR"
    }
  }
}
