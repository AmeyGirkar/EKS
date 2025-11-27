resource "helm_release" "argocd" {
  name       = var.release_name
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.chart_version
  namespace  = var.namespace

  # Expose the UI via a LoadBalancer (easy for a demo).  Change to Ingress if you prefer.
  # set = [{
  #   name  = "server.service.type"
  #   value = "LoadBalancer"
  # }]

  # Pass any custom values the user supplies (YAML or map)
  # values = var.custom_values
}


provider "helm" {
  kubernetes {
    host                   = var.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(var.eks_cluster_certificate_authority)
    token                  = var.eks_cluster_token
  }
}
