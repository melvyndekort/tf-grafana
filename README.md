# tf-grafana

Terraform configuration for managing Grafana Cloud infrastructure.

## Overview

This repository manages:
- Grafana Cloud stack
- Service accounts and tokens
- SSO configuration (GitHub and AWS Cognito)
- Role assignments

## Usage

1. Ensure you're authenticated with AWS: `assume`
2. Decrypt secrets: `make decrypt`
3. Initialize Terraform: `terraform -chdir=terraform init`
4. Plan changes: `terraform -chdir=terraform plan`
5. Apply changes: `terraform -chdir=terraform apply`
6. Encrypt secrets: `make encrypt`

## Dependencies

This configuration depends on:
- tf-aws (for Cognito user pool)
- Grafana Cloud account

## Outputs

- `grafana_url`: Grafana Cloud stack URL
- `terraform_token`: Service account token for Terraform
- `email_infra_token`: Service account token for email infrastructure
- `loki_url`: Loki logs URL
- `prometheus_url`: Prometheus metrics URL
