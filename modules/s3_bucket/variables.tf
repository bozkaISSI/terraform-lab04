variable "bucket_name_prefix" {
  description = "Prefix for the S3 bucket name"
  type        = string
}

variable "region" {
  description = "AWS region where bucket is deployed"
  type        = string
}

variable "random_suffix" {
  description = "Random suffix to ensure bucket name uniqueness"
  type        = string
}

variable "lifecycle_days" {
  description = "Number of days after which to transition objects to Glacier"
  type        = number
  default     = 90
}

variable "lifecycle_storage_class" {
  description = "Storage class for lifecycle transition"
  type        = string
  default     = "GLACIER"
}
