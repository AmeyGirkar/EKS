resource "helm_release" "chart" {
  name       = var.helm_chart_name
  repository = var.helm_repository
  chart      = var.helm_chart_name
  version    = var.helm_chart_version

  # Optional values can be passed as a YAML string or map
  values = var.helm_values

  # Ensure the Helm release is recreated if the chart version changes
  lifecycle {
    replace_triggered_by = var.helm_chart_version
  }
}
