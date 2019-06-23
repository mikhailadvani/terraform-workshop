provider "aws" {
  version = "2.16.0"
  region  = "eu-west-1"
}

terraform {
  required_version = "0.11.14"
  backend          "s3"             {}
}

resource "aws_s3_bucket" "backend_bucket" {
  bucket = "terraform-workshop-mikhailadvani-backend"
}

resource "aws_dynamodb_table" "locking_table" {
  name           = "terraform-state-lock"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}
