resource "aws_eks_cluster" "eks" {

  count    = var.is-eks-cluster-enabled == true ? 1 : 0
  name     = var.cluster-name
  role_arn = aws_iam_role.eksClusterRole.arn
  version  = var.cluster-version

  vpc_config {
    subnet_ids              = var.private_subnet_ids
    endpoint_private_access = var.endpoint-private-access
    endpoint_public_access  = var.endpoint-public-access
    security_group_ids      = [var.eks_sg_id]
  }


  access_config {
    authentication_mode                         = "CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }

  tags = {
    Name = var.cluster-name
  }
}


# AddOns for EKS Cluster (only when ASG is created)
resource "aws_eks_addon" "eks-addons" {
  for_each                    = var.create_node_groups ? { for idx, addon in var.addons : idx => addon } : {}
  cluster_name                = aws_eks_cluster.eks[0].name
  addon_name                  = each.value.name
  addon_version               = each.value.version
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

}

# NodeGroups - Using Launch Templates and CloudFormation ASG instead
# See launch_template.tf for the ASG configuration

