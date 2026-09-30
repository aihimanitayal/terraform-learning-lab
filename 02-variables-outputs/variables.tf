variable "project_name" {
  description = "Name of your project"
  type        = string
  default     = "terraform-lab"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

variable "features" {
  description = "List of feature flags to enable"
  type        = list(string)
  default     = ["logging", "monitoring"]
}
