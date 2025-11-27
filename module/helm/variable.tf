variable "helm_release_name" {
  description = "Name of the Helm release."
  type        = string
  default     = "my-release"
}

variable "helm_repository" {
  description = "Helm chart repository URL."
  type        = string
  default     = "[https://charts.helm.sh/stable](https://charts.helm.sh/stable)"
}

variable "helm_chart_name" {
  description = "Name of the Helm chart to install."
  type        = string
  default     = "nginx"
}

variable "helm_chart_version" {
  description = "Version of the Helm chart."
  type        = string
  default     = "latest"
}

variable "helm_namespace" {
  description = "Kubernetes namespace for the release."
  type        = string
  default     = "default"
}

variable "helm_values" {
  description = "Custom values for the Helm chart (YAML string or map)."
  type        = any
  default     = {}
}
