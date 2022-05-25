terraform {
  backend "s3" {
    bucket = "terraform-state-bukt"
    #dynamodb_table = "terraform-state"
    key     = "terraform-aws-eks-workshop.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
