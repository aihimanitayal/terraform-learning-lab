# Lesson 02: Input variables, locals, and outputs

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

locals {
  # Locals are computed values you can reuse
  file_name = "${var.environment}-${var.project_name}.txt"
  common_tags = {
    project     = var.project_name
    environment = var.environment
  }
}

resource "local_file" "config" {
  filename = "${path.module}/output/${local.file_name}"
  content = templatefile("${path.module}/config.tpl", {
    project     = var.project_name
    environment = var.environment
    features    = var.features
    tags        = local.common_tags
  })
}
