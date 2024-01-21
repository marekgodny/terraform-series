locals {
  files_content = {
    "first_file.txt": "Hello, Terraform! (first file)",
    "second_file.txt": "Hello, Terraform! (second file)",
    "third_file.txt": "Hello, Terraform! (third file)",
  }
}

resource "local_file" "this" {
  for_each = local.files_content

  filename = each.key
  content  = each.value
}
