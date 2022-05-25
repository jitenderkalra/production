terraform {
  required_version = ">= 1.1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  access_key = "AKIAUVP4GIIIFKJ5RZOX"
  secret_key = "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"
  # other options for authentication
}
