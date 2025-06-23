output "bucket_arns" {
  value = {
    "${var.regions[0]}" = aws_s3_bucket.buckets[0].arn,
    "${var.regions[1]}" = aws_s3_bucket.buckets_west[0].arn,
  }
}

output "bucket_regions" {
  value = {
    "${aws_s3_bucket.buckets[0].id}"       = var.regions[0],
    "${aws_s3_bucket.buckets_west[0].id}"  = var.regions[1],
  }
}

output "bucket_versioning_status" {
  value = {
    "${var.regions[0]}" = aws_s3_bucket_versioning.buckets_versioning[0].versioning_configuration[0].status,
    "${var.regions[1]}" = aws_s3_bucket_versioning.buckets_versioning_west[0].versioning_configuration[0].status,
  }
}
