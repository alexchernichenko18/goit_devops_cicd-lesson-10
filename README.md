# GoIT DevOps CI/CD — Lesson 10

Terraform-проєкт для розгортання інфраструктури AWS з підтримкою CI/CD pipeline.

## Архітектура

Проєкт складається з наступних модулів:

| Модуль | Опис |
|--------|------|
| **VPC** | VPC (`10.0.0.0/16`) з 3 публічними та 3 приватними підмережами в `eu-central-1` (AZ: a, b, c) |
| **EKS** | Kubernetes-кластер `eks-cluster-demo` з managed node group (`t2.micro`, 1–2 ноди) |
| **ECR** | Container registry `lesson-5-ecr` з автоматичним скануванням образів |
| **RDS** | Aurora PostgreSQL 15.3 кластер (`db.t3.medium`) з writer + reader репліками, Multi-AZ, бекапи 7 днів |
| **S3 Backend** | Віддалений стейт у S3 + DynamoDB lock table |
| **Jenkins** | CI-сервер на EKS (Helm-чарт) — *закоментовано* |
| **Argo CD** | GitOps CD на EKS — *закоментовано* |

## Helm Charts

- **django-app** — Deployment + Service (LoadBalancer:8000) + HPA + ConfigMap для Django-додатку

## Передумови

- Terraform >= 1.0
- AWS CLI налаштований з відповідними credentials
- `kubectl` (для роботи з EKS)
- `helm` (для деплою чартів)

## Швидкий старт

```bash
# Ініціалізація
terraform init

# Перегляд змін
terraform plan

# Застосування
terraform apply
```

## Outputs

| Output | Опис |
|--------|------|
| `s3_bucket_name` | Ім'я S3-бакета для стейту |
| `dynamodb_table_name` | Ім'я DynamoDB таблиці для locks |
| `repository_url` | URL ECR-репозиторію |
| `vpc_id` | ID VPC |
| `public_subnets` / `private_subnets` | ID підмереж |
| `eks_cluster_endpoint` | Endpoint API EKS-кластера |
| `eks_cluster_name` | Назва EKS-кластера |

## Підключення до EKS

```bash
aws eks update-kubeconfig --name eks-cluster-demo --region eu-central-1
```

## Відомі проблеми безпеки

> **УВАГА:** Цей проєкт призначений для навчання. Для production-середовища необхідно виправити:

1. **Пароль у відкритому вигляді**: Пароль БД передається як plaintext у `main.tf`. Рекомендується використовувати AWS Secrets Manager або `terraform.tfvars` (додати в `.gitignore`).
2. **`publicly_accessible = true`**: База даних доступна з інтернету — у production має бути `false`.
