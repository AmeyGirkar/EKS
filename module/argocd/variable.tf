variable "release_name" {
  description = "Helm release name for Argo CD"
  type        = string
  default     = "argocd"
}

variable "namespace" {
  description = "Kubernetes namespace where Argo CD will be installed"
  type        = string
  default     = "argocd"
}

variable "chart_version" {
  description = "Version of the Argo CD Helm chart"
  type        = string
  default     = "5.51.0" # update as needed
}

variable "custom_values" {
  description = "Optional custom Helm values (YAML string or map)"
  type        = any
  default     = {}
}
