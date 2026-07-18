# Orbit Labs Terraform Configuration
# Managed by Spacelift

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "orbit_storage" {
  bucket_prefix = "orbit-storage-"

  tags = {
    name      = "Orbit Labs Storages"
    managedBy = "Spacelift"
    mission   = "First Launch"
    project   = "Orbit-labs"
  }
}

output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}