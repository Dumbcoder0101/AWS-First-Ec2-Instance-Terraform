terraform {
  backend "s3" {
    bucket = "tfstate-murtaza"
    region = "us-east-1"
    key = "terraform.tfstate"
    dynamodb_table = "ec2-dynamodb-table-murtaza"
  }
}