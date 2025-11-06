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

module "kd-module" {
    source = "./modules/ec2"
    kd-ami-id = "ami-0a25a306450a2cba3"
    vm-size = "t2.nano"
    vm-name = "kd-vm-1"
    ec2-key-name = "roche-key-kd"
    key-algo-rsa = "RSA"
    rsa-bits = 4096
    file-perm = 0400
    aws-pair-key-name = "kd-ec2-key-day3"
    my-vpc-id = "vpc-02d56e9aa1ce2f114"
    my-sec-group = "kd-sec-group"
    vmcount = 2
}