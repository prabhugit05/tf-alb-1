/*terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "2.7.0"
    }
  }
}*/

# Configure AWS provider:

provider "aws" {
  region                  = var.region
  /*shared_credentials_file = "/Users/tf_prabhu/.aws/credentials"*/
  
}
terraform {
  backend "s3" {
    bucket = "ALB-tf-bucket"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform"
  }
}