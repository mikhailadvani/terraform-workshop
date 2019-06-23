provider "aws" {
  version = "2.16.0"
  region  = "eu-west-1"
}

terraform {
  required_version = "0.11.14"
}

resource "aws_s3_bucket" "terraform_workshop" {
  bucket = "terraform-workshop-mikhailadvani"
}

resource "local_file" "user" {
  content = <<EOF
Name: "abc"
Email: "abc@email.com"
EOF

  filename = "${path.module}/user.txt"
}

resource "aws_s3_bucket_object" "object" {
  bucket = "${aws_s3_bucket.terraform_workshop.bucket}"
  key    = "${local_file.user.filename}"
  source = "${path.module}/user.txt"
}
