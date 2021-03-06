
variable "region" {
  default     = "us-east-2"
  description = "The region to deploy the cluster in, e.g: us-east-1."
}



terraform {
  required_version = ">= 0.10.5"
  backend "s3" {
    bucket = "aws-demo-terraform"
    key    = "iam/terraform.tfstate"
    region = "us-east-2"
    encrypt = true

  }
}

data "terraform_remote_state" "default" {
  backend = "s3"
  config {
    bucket = "aws-demo-terraform"
    key    = "iam/terraform.tfstate"
    region = "us-east-2"
    encrypt = true
  }
}


# Define your AWS profile here
provider "aws" {
  region  = "us-east-2"
  version = "~> 0.1.4"
}
