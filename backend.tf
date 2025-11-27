terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket  = "amey-terraform-kubernetes-cluster1"
    region  = "us-east-1"
    key     = "eks/terraform.tfstate"
    encrypt = true
  }
}
provider "aws" {
  region = "us-east-1"
}
