resource "local_file" "this" {
  count = 5

  filename = "hello_terraform_${count.index}.txt"
  content  = "Hello, Terraform! (index: ${count.index})"
}
