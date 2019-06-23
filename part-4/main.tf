provider "aws" {
  version = "2.16.0"
  region  = "eu-west-1"
}

terraform {
  required_version = "0.11.14"
  backend          "s3"             {}
}

module "backend" {
  # source = "../../terraform-s3-backend"
  source              = "git::https://github.com/mikhailadvani/terraform-s3-backend.git?ref=master"
  bucket_name         = "terraform-workshop-mikhailadvani-backend-bucket"
  dynamodb_table_name = "terraform-workshop-mikhailadvani-locking-table"
}
