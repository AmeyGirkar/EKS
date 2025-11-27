resource "helm_release" "argocd" {
  name       = var.release_name
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.chart_version
  namespace  = var.namespace

  # Expose the UI via a LoadBalancer (easy for a demo).  Change to Ingress if you prefer.

  # Pass any custom values the user supplies (YAML or map)
  values = var.custom_values
}
