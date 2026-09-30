# Lesson 01: Providers, resources, and state
# Run: terraform init && terraform plan && terraform apply

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

# A resource that generates a random value (stored in state)
resource "random_pet" "name" {
  length = 2
}

# A resource that creates a real file on your machine
resource "local_file" "hello" {
  filename = "${path.module}/output/hello-${random_pet.name.id}.txt"
  content  = "Hello from Terraform! My name is ${random_pet.name.id}.\n"
}

output "file_path" {
  description = "Where the file was created"
  value       = local_file.hello.filename
}
