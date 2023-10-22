terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.16.1"
        }
    }
    backend "s3" {
        bucket = "terraform-backend-S3" ##S3 bucket name
        key = "/dev/terraform.tfstate"  ##storing path for statefile
        region = "us-east-1"
    }
}

provider "aws" {
    region = "use-east-1"
}