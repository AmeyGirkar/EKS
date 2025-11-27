/*
  This file adds the required data sources, Kubernetes provider configuration, and the aws-auth ConfigMap
  to attach the worker node IAM role to the EKS cluster.
*/

# -------------------------------------------------
# Data sources for the EKS cluster created by the module
# -------------------------------------------------



data "aws_eks_cluster_auth" "eks" {
  name = module.eks.eks_cluster_name
}

# -------------------------------------------------
# Kubernetes provider – points to the newly created cluster
# -------------------------------------------------
provider "kubernetes" {
  host                   = module.eks.eks_cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.eks_cluster_certificate_authority)
  token                  = data.aws_eks_cluster_auth.eks.token
}

# -------------------------------------------------
# Attach the node IAM role to the aws-auth ConfigMap
# -------------------------------------------------
resource "kubernetes_config_map_v1" "aws_auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapRoles = yamlencode([
      {
        rolearn  = module.eks.node_role_arn
        username = "system:node:{{EC2PrivateDNSName}}"
        groups = [
          "system:bootstrappers",
          "system:nodes"
        ]
      }
    ])
  }


}
