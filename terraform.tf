
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket =  "tws-surya-s3-bucket"   
    key = "terraform.tfstate"
    region = "us-west-1"
    dynamodb_table =  "GameScores"
  }
}