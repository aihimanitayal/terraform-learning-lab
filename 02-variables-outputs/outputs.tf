output "config_file" {
  description = "Path of the generated config file"
  value       = local_file.config.filename
}

output "tags" {
  description = "Common tags map"
  value       = local.common_tags
}
