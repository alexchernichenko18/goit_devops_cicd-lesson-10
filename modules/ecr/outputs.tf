output "repository_url" {
  description = "ECR URL"
  value       = aws_ecr_repository.this.repository_url
}

output "repository_arn" {
  description = "ECR ARN"
  value       = aws_ecr_repository.this.arn
}
