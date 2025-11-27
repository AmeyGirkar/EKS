# ===== VPC Variables =====
variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
  default     = "eks-vpc"
}

variable "igw_name" {
  type        = string
  description = "Name of the Internet Gateway"
  default     = "eks-igw"
}

variable "pub_subnet_count" {
  type        = number
  description = "Number of public subnets"
  default     = 3
}

variable "pub_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks for public subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "pub_availability_zones" {
  type        = list(string)
  description = "Availability zones for public subnets"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "pub_sub_name" {
  type        = string
  description = "Name prefix for public subnets"
  default     = "eks-public-subnet"
}

variable "pri_subnet_count" {
  type        = number
  description = "Number of private subnets"
  default     = 3
}

variable "pri_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks for private subnets"
  default     = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
}

variable "pri_availability_zones" {
  type        = list(string)
  description = "Availability zones for private subnets"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "pri_sub_name" {
  type        = string
  description = "Name prefix for private subnets"
  default     = "eks-private-subnet"
}

variable "public_rt_name" {
  type        = string
  description = "Name of the public route table"
  default     = "eks-public-rt"
}

variable "private_rt_name" {
  type        = string
  description = "Name of the private route table"
  default     = "eks-private-rt"
}

variable "eip_name" {
  type        = string
  description = "Name of the Elastic IP for NAT Gateway"
  default     = "eks-ngw-eip"
}

variable "ngw_name" {
  type        = string
  description = "Name of the NAT Gateway"
  default     = "eks-ngw"
}

variable "eks_sg_name" {
  type        = string
  description = "Name of the EKS cluster security group"
  default     = "eks-cluster-sg"
}

# ===== EKS Cluster Variables =====
variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
  default     = "eks-cluster"
}

variable "is_eks_cluster_enabled" {
  type        = bool
  description = "Whether to create the EKS cluster"
  default     = true
}

variable "create_node_groups" {
  type        = bool
  description = "Whether to create node groups (set to false if you don't have permissions)"
  default     = true
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version to use for the EKS cluster"
  default     = "1.32"
}

variable "endpoint_private_access" {
  type        = bool
  description = "Enable private API server endpoint"
  default     = true
}

variable "endpoint_public_access" {
  type        = bool
  description = "Enable public API server endpoint"
  default     = true
}

# ===== EKS Add-ons Variables =====
variable "addons" {
  type = list(object({
    name    = string
    version = string
  }))
  description = "List of EKS add-ons to install (leave empty if you don't have permissions)"
  default = [{
    name    = "vpc-cni",
    version = "v1.20.0-eksbuild.1"
    },
    {
      name    = "coredns"
      version = "v1.11.4-eksbuild.14"
    },
    {
      name    = "kube-proxy"
      version = "v1.32.5-eksbuild.2"
    },
    {
      name    = "aws-ebs-csi-driver"
      version = "v1.46.0-eksbuild.1"
  }]
}

# ===== EKS Node Group Variables =====
variable "ondemand_instance_types" {
  type        = list(string)
  description = "Instance types for on-demand node group"
  default     = ["t2.medium"]
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

variable "spot_instance_types" {
  type        = list(string)
  description = "Instance types for spot node group"
  default     = ["t2.small", "t2.medium"]
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

# ===== EKS IAM Variables =====
variable "cluster_role_name" {
  type        = string
  description = "Name of the EKS cluster role"
  default     = "eksClusterRole"
}

variable "nodegroup_role_name" {
  type        = string
  description = "Name of the EKS nodegroup role"
  default     = "eksNodeGroupRole"
}

variable "additional_policy_arns" {
  type        = list(string)
  description = "ARNs of additional policies to attach to cluster role"
  default     = []
}
variable "additional_policy_name" {
  type        = string
  description = "Name of the additional IAM policy to attach to the node‑group role"
  default     = "my-additional-policy-1"
}
