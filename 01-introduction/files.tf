resource "local_file" "first_file" {
  filename = "hello_terraform.txt"
  content  = "Hello, Terraform!"
}
