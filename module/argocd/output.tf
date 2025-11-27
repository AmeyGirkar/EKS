output "argocd_server_service_ip" {
  description = "External IP of the argocd‑server LoadBalancer"
  value       = kubernetes_service.argocd_server.status[0].load_balancer[0].ingress[0].ip
}
