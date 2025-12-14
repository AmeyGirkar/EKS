terraform {
  backend "s3" {
    bucket  = "amey-terraform-kubernetes-cluster2"
    region  = "us-east-1"
    key     = "eks/terraform.tfstate"
    encrypt = true
  }
}
