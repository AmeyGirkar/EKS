output "vpc_id" {
  value       = aws_vpc.vpc.id
  description = "The ID of the VPC"
}

output "public_subnet_ids" {
  value       = aws_subnet.public-subnet[*].id
  description = "List of public subnet IDs"
}

output "private_subnet_ids" {
  value       = aws_subnet.private-subnet[*].id
  description = "List of private subnet IDs"
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.igw.id
  description = "The ID of the Internet Gateway"
}

output "nat_gateway_id" {
  value       = aws_nat_gateway.ngw.id
  description = "The ID of the NAT Gateway"
}

output "nat_gateway_eip" {
  value       = aws_eip.ngw-eip.public_ip
  description = "The Elastic IP address of the NAT Gateway"
}

output "public_route_table_id" {
  value       = aws_route_table.public-rt.id
  description = "The ID of the public route table"
}

output "private_route_table_id" {
  value       = aws_route_table.private-rt.id
  description = "The ID of the private route table"
}

output "eks_security_group_id" {
  value       = aws_security_group.eks-cluster-sg.id
  description = "The ID of the EKS cluster security group"
}
