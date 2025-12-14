# VPC Configuration
vpc_cidr               = "10.0.0.0/16"
vpc_name               = "eks-vpc"
igw_name               = "eks-igw"
pub_subnet_count       = 3
pub_cidr_blocks        = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
pub_availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
pub_sub_name           = "eks-public-subnet"
pri_subnet_count       = 3
pri_cidr_blocks        = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
pri_availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
pri_sub_name           = "eks-private-subnet"
public_rt_name         = "eks-public-rt"
private_rt_name        = "eks-private-rt"
eip_name               = "eks-ngw-eip"
ngw_name               = "eks-ngw"
eks_sg_name            = "eks-cluster-sg"

# EKS Cluster Configuration
cluster_name            = "eks-cluster"
is_eks_cluster_enabled  = true
create_node_groups      = true
cluster_version         = "1.32"
endpoint_private_access = true
endpoint_public_access  = true

# EKS Add-ons
addons = [
  {
    name    = "vpc-cni"
    version = "v1.20.0-eksbuild.1"
  },
  {
    name    = "coredns"
    version = "v1.11.4-eksbuild.20"
  },
  {
    name    = "kube-proxy"
    version = "v1.32.5-eksbuild.2"
  },
  {
    name    = "aws-ebs-csi-driver"
    version = "v1.45.0-eksbuild.2"
  }
]

# EKS Node Groups
ondemand_instance_types    = ["t2.medium"]
desired_capacity_on_demand = 3
min_capacity_on_demand     = 1
max_capacity_on_demand     = 4

spot_instance_types   = ["t2.small", "t2.medium"]
desired_capacity_spot = 1
min_capacity_spot     = 0
max_capacity_spot     = 3

# IAM Roles
cluster_role_name      = "eksClusterRole"
nodegroup_role_name    = "eksNodeGroupRole"
additional_policy_arns = []
additional_policy_name = "my-additional-policy"
