#-------------Backend-----------------

output "s3_bucket_name" {
  description = "S3-bucket name"
  value       = module.s3_backend.s3_bucket_name
}

output "dynamodb_table_name" {
  description = "DynamoDB table name"
  value       = module.s3_backend.dynamodb_table_name
}

#-------------ECR-----------------

output "repository_url" {
  description = "ECR URL"
  value       = module.ecr.repository_url
}

output "repository_arn" {
  description = "ECR ARN"
  value       = module.ecr.repository_arn
}

#-------------VPC-----------------

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "public_subnets IDs"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "private_subnets IDs"
  value       = module.vpc.private_subnets
}

output "internet_gateway_id" {
  description = "ID Internet Gateway"
  value       = module.vpc.internet_gateway_id
}

/*
output "aws_eip_id" {
  description = "ID Elastic IP"
  value       = module.vpc.aws_eip_id
}

output "aws_nat_gateway_id" {
  description = "ID NAT Gateway"
  value       = module.vpc.aws_nat_gateway_id
}*/

#-------------EKS-----------------

output "eks_cluster_endpoint" {
  description = "EKS API endpoint for connecting to the cluster"
  value       = module.eks.eks_cluster_endpoint
}

output "eks_cluster_name" {
  description = "Name of the EKS cluster"
  value       = module.eks.eks_cluster_name
}

output "eks_node_role_arn" {
  description = "IAM role ARN for EKS Worker Nodes"
  value       = module.eks.eks_node_role_arn
}
/*
#--------Jenkins--------------

output "jenkins_release" {
  value = module.jenkins.jenkins_release_name
}

output "jenkins_namespace" {
  value = module.jenkins.jenkins_namespace
}

#---------ArgoCD-----

output "argo_cd_pass" {
  description = "argo-cd pass"
  value       = module.argo_cd.admin_password
}*/