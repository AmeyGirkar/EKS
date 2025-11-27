# ===== VPC Module =====
module "vpc" {
  source = "./module/vpc"

  cidr-block            = var.vpc_cidr
  vpc-name              = var.vpc_name
  igw-name              = var.igw_name
  pub-subnet-count      = var.pub_subnet_count
  pub-cidr-block        = var.pub_cidr_blocks
  pub-availability-zone = var.pub_availability_zones
  pub-sub-name          = var.pub_sub_name
  pri-subnet-count      = var.pri_subnet_count
  pri-cidr-block        = var.pri_cidr_blocks
  pri-availability-zone = var.pri_availability_zones
  pri-sub-name          = var.pri_sub_name
  public-rt-name        = var.public_rt_name
  private-rt-name       = var.private_rt_name
  eip-name              = var.eip_name
  ngw-name              = var.ngw_name
  eks-sg                = var.eks_sg_name
}

# ===== EKS Module =====
module "eks" {
  source = "./module/eks"

  # Cluster Configuration
  cluster-name            = var.cluster_name
  is-eks-cluster-enabled  = var.is_eks_cluster_enabled
  create_node_groups      = var.create_node_groups
  cluster-version         = var.cluster_version
  endpoint-private-access = var.endpoint_private_access
  endpoint-public-access  = var.endpoint_public_access

  # Add-ons
  addons = var.addons

  # On-Demand Node Group
  ondemand_instance_types    = var.ondemand_instance_types
  desired_capacity_on_demand = var.desired_capacity_on_demand
  min_capacity_on_demand     = var.min_capacity_on_demand
  max_capacity_on_demand     = var.max_capacity_on_demand

  # Spot Node Group
  spot_instance_types   = var.spot_instance_types
  desired_capacity_spot = var.desired_capacity_spot
  min_capacity_spot     = var.min_capacity_spot
  max_capacity_spot     = var.max_capacity_spot

  # IAM Roles
  cluster_role_name      = var.cluster_role_name
  nodegroup_role_name    = var.nodegroup_role_name
  additional_policy_arns = var.additional_policy_arns

  # VPC and Networking
  private_subnet_ids     = module.vpc.private_subnet_ids
  public_subnet_ids      = module.vpc.public_subnet_ids
  eks_sg_id              = module.vpc.eks_security_group_id
  vpc_id                 = module.vpc.vpc_id
  depends_on             = [module.vpc]
  additional_policy_name = var.additional_policy_name
}

# ===== Outputs =====
output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the VPC"
}

output "eks_cluster_id" {
  value       = module.eks.eks_cluster_id
  description = "The ID of the EKS cluster"
}

output "eks_cluster_endpoint" {
  value       = module.eks.eks_cluster_endpoint
  description = "Endpoint for EKS control plane"
}

output "eks_cluster_certificate_authority" {
  value       = module.eks.eks_cluster_certificate_authority
  sensitive   = true
  description = "Base64 encoded certificate data required to communicate with the cluster"
}
