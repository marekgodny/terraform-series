data "local_file" "this" {
  filename = "ABSOLUTE_PATH_TO_SOURCE_FILE"
}

resource "local_file" "this" {
  content  = data.local_file.this.content
  filename = "my_file_with_another_file_content.txt"
}