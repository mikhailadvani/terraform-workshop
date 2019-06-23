terraform {
  required_version = "0.11.14"
}

variable "name" {}
variable "email" {}

variable "filename" {
  default = "user.txt"
}

resource "local_file" "user" {
  content = <<EOF
Name: "${var.name}"
Email: "${var.email}"
EOF

  filename = "${path.module}/${var.filename}"
}

output "filename" {
  value = "${local_file.user.filename}"
}
