terraform {
    required_version = "~> 1.2"
    required_providers {
        aws = {
            version = "~> 3.0"
            ssource = "hashicorp/aws"
        }
    }
}

provider "aws" {
    description = "Select AWS Region"
    region = var.my-aws-region
    #profile =
}









