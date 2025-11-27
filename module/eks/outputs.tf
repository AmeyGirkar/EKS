output "eks_cluster_id" {
  value       = var.is-eks-cluster-enabled == true ? aws_eks_cluster.eks[0].id : ""
  description = "The ID of the EKS cluster"
}

output "eks_cluster_name" {
  value       = var.is-eks-cluster-enabled == true ? aws_eks_cluster.eks[0].name : ""
  description = "The name of the EKS cluster"
}

output "eks_cluster_arn" {
  value       = var.is-eks-cluster-enabled == true ? aws_eks_cluster.eks[0].arn : ""
  description = "The ARN of the EKS cluster"
}

output "eks_cluster_endpoint" {
  value       = var.is-eks-cluster-enabled == true ? aws_eks_cluster.eks[0].endpoint : ""
  description = "Endpoint for EKS control plane"
}

output "eks_cluster_certificate_authority" {
  value       = var.is-eks-cluster-enabled == true ? aws_eks_cluster.eks[0].certificate_authority[0].data : ""
  sensitive   = true
  description = "Base64 encoded certificate data required to communicate with the cluster"
}

output "eks_cluster_security_group_id" {
  value       = var.is-eks-cluster-enabled == true ? aws_eks_cluster.eks[0].vpc_config[0].cluster_security_group_id : ""
  description = "The security group ID attached to the EKS cluster"
}

output "eks_cluster_status" {
  value       = var.is-eks-cluster-enabled == true ? aws_eks_cluster.eks[0].status : ""
  description = "Status of the EKS cluster"
}

output "ondemand_node_group_id" {
  value       = ""
  description = "The ID of the on-demand node group (disabled - using launch template ASG)"
}

output "spot_node_group_id" {
  value       = ""
  description = "The ID of the spot node group (disabled - using launch template ASG)"
}

output "autoscaling_group_name" {
  value       = var.create_node_groups ? try(aws_cloudformation_stack.autoscaling_group.outputs["NodeAutoScalingGroup"], "") : ""
  description = "The name of the auto scaling group created by CloudFormation"
}

output "eks_addons" {
  value       = { for key, addon in aws_eks_addon.eks-addons : key => addon.id }
  description = "Map of EKS add-ons"
}

output "node_role_arn" {
  value       = aws_iam_role.node_instance_role.arn
  description = "The ARN of the node group IAM role"
}
