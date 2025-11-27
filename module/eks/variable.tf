variable "cluster-name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "is-eks-cluster-enabled" {
  type        = bool
  description = "Whether to create the EKS cluster"
  default     = true
}

variable "create_node_groups" {
  type        = bool
  description = "Whether to create node groups (set to false if you don't have permissions)"
  default     = true
}

variable "cluster-version" {
  type        = string
  description = "Kubernetes version to use for the EKS cluster"
  default     = "1.32"
}

variable "endpoint-private-access" {
  type        = bool
  description = "Enable private API server endpoint"
  default     = true
}

variable "endpoint-public-access" {
  type        = bool
  description = "Enable public API server endpoint"
  default     = true
}

variable "node_role_name" {
  type        = string
  description = "Name of node role"
  default     = "eksWorkerNodeRole"
}

variable "addons" {
  type = list(object({
    name    = string
    version = string
  }))
  description = "List of EKS add-ons to install"
  default = [
  ]
}

variable "ondemand_instance_types" {
  type        = list(string)
  description = "Instance types for on-demand node group"
  default     = ["t3.medium"]
}

variable "spot_instance_types" {
  type        = list(string)
  description = "Instance types for spot node group"
  default     = ["t3.medium", "t3a.medium"]
}

variable "desired_capacity_on_demand" {
  type        = number
  description = "Desired number of on-demand nodes"
  default     = 2
}

variable "min_capacity_on_demand" {
  type        = number
  description = "Minimum number of on-demand nodes"
  default     = 1
}

variable "max_capacity_on_demand" {
  type        = number
  description = "Maximum number of on-demand nodes"
  default     = 4
}

variable "desired_capacity_spot" {
  type        = number
  description = "Desired number of spot nodes"
  default     = 1
}

variable "min_capacity_spot" {
  type        = number
  description = "Minimum number of spot nodes"
  default     = 0
}

variable "max_capacity_spot" {
  type        = number
  description = "Maximum number of spot nodes"
  default     = 3
}

variable "cluster_role_name" {
  type        = string
  description = "Name of the cluster role"
  default     = "eksClusterRole"
}

variable "additional_policy_arns" {
  type        = list(string)
  description = "ARNs of policies to attach to cluster role"
  default     = []
}

variable "nodegroup_role_name" {
  type        = string
  description = "Name of the nodegroup role"
  default     = "eksNodeGroupRole"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs from VPC module"
}

variable "eks_sg_id" {
  type        = string
  description = "EKS cluster security group ID from VPC module"
}

variable "node_group_min_size" {
  type        = number
  description = "Minimum number of nodes in the node group"
  default     = 1
}

variable "node_group_max_size" {
  type        = number
  description = "Maximum number of nodes in the node group"
  default     = 3
}

variable "node_group_desired_capacity" {
  type        = number
  description = "Desired number of nodes in the node group"
  default     = 2
}

variable "node_instance_type" {
  type        = string
  description = "Instance type for worker nodes"
  default     = "t2.small"
}

variable "node_volume_size" {
  type        = number
  description = "EBS volume size for worker nodes"
  default     = 30
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs from VPC module"
}

data "aws_ssm_parameter" "node_ami" {
  name = "/aws/service/eks/optimized-ami/1.31/amazon-linux-2/recommended/image_id"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID from VPC module"
}

variable "additional_policy_name" {
  type        = string
  description = "Name of the additional policy to attach to nodegroup role"
}
