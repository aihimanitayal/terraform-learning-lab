# Lesson 05 (OPTIONAL): A real cloud resource on AWS
# Requires AWS credentials (aws configure). An empty S3 bucket is essentially free,
# but ALWAYS run `terraform destroy` when you are done.

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# S3 bucket names are globally unique, so add a random suffix
resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "lab" {
  bucket        = "${var.bucket_prefix}-${random_id.suffix.hex}"
  force_destroy = true # lets `terraform destroy` delete a non-empty bucket (lab only!)

  tags = {
    Project   = "terraform-learning-lab"
    ManagedBy = "terraform"
  }
}

resource "aws_s3_bucket_versioning" "lab" {
  bucket = aws_s3_bucket.lab.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "lab" {
  bucket                  = aws_s3_bucket.lab.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
