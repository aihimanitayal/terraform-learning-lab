resource "local_file" "greeting" {
  filename = "${path.root}/output/${lower(var.name)}.txt"
  content  = "${var.greeting}, ${var.name}!\n"
}
