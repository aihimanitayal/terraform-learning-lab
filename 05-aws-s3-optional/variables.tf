variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "ap-south-1"
}

variable "bucket_prefix" {
  description = "Prefix for the bucket name (lowercase letters, numbers, hyphens)"
  type        = string
  default     = "tf-learning-lab"
}
