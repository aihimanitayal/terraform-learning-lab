# Lesson 04: Reusable modules

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

module "greeting_english" {
  source   = "./modules/greeting_file"
  name     = "Alice"
  greeting = "Hello"
}

module "greeting_spanish" {
  source   = "./modules/greeting_file"
  name     = "Bob"
  greeting = "Hola"
}

output "files" {
  value = [
    module.greeting_english.file_path,
    module.greeting_spanish.file_path,
  ]
}
