terraform {
  required_version = "~> 1.11.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.50.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.38.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.9" # pick a recent version that supports the `set` block
    }
  }
  backend "s3" {
    bucket  = "amey-terraform-kubernetes-cluster3"
    region  = "us-east-1"
    key     = "eks/terraform.tfstate"
    encrypt = true
  }
}
provider "aws" {
  region = "us-east-1"
}



provider "helm" {
  kubernetes = {
    host                   = module.eks.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.eks_cluster_certificate_authority)
    token                  = data.aws_eks_cluster_auth.eks.token
  }
}
