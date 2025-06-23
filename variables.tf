variable "regions" {
  description = "List of AWS regions for buckets"
  type        = list(string)
  default     = ["us-east-1", "us-west-2"]
}

variable "bucket_name_prefix" {
  description = "Prefix used in bucket names"
  type        = string
  default     = "multi-region-bucket"
}
