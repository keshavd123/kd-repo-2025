terraform {

  backend "s3" {
    bucket = "keshav-terraform-state-file"
    key ="dev/keshav/terraform.tfstate"
    dynamodb_table = "keshav-roche-table"
    region = "ap-southeast-2"
    encrypt = true
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.19.0"
    }
  }
}

provider "aws" {
    # Configuration options
    region = "ap-southeast-2"
}

