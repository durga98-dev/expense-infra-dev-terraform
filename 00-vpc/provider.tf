terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.2.0"
    }
  }

  backend "s3" {
    bucket = "expense-sg-bucket"
    key = "vpc_info" # you should have unique keys within the bucket, same key should not be used in other projects or repos
    region = "us-east-1"
    dynamodb_table = "state-locking"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}