# tf-grafana

> For global standards, way-of-workings, and pre-commit checklist, see `~/.kiro/steering/behavior.md`

## Role

Cloud Engineer specializing in Terraform and Grafana Cloud.

## Important: Dual Grafana Providers

This repo uses two Grafana provider aliases:
- `grafana.cloud` — managing the Grafana Cloud organization (stack creation)
- `grafana.mdekort` — managing resources within the stack (dashboards, data sources, service accounts)

The `mdekort` provider depends on the stack being created first.

## Repository Structure

- `terraform/main.tf` — Grafana Cloud stack and service accounts
- `terraform/sso.tf` — SSO configuration (GitHub + AWS Cognito)
- `terraform/roles.tf` — Role assignments
- `terraform/outputs.tf` — Grafana URL, tokens, Loki/Prometheus URLs
- `terraform/secrets.tf` — KMS-encrypted secrets loading
- `Makefile` — `decrypt`, `encrypt`, `clean_secrets`

## Outputs Consumed by Other Repos

- `email-infra` — `grafana_url` + `email_infra_token` for dashboard management

## Terraform Details

- Backend: S3 key `tf-grafana.tfstate` in `mdekort-tfstate-075673041815`
- Providers: AWS `~> 6.0`, Grafana `~> 4.8`
- Secrets: KMS context `target=tf-grafana`

## Related Repositories

- `~/src/melvyndekort/tf-cognito` — Cognito user pool used for Grafana SSO
- `~/src/melvyndekort/email-infra` — Consumes Grafana tokens for dashboard management
