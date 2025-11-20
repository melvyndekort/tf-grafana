output "grafana_url" {
  value = grafana_cloud_stack.mdekort.url
}

output "terraform_token" {
  value     = grafana_cloud_stack_service_account_token.terraform.key
  sensitive = true
}

output "email_infra_token" {
  value     = grafana_cloud_stack_service_account_token.email_infra.key
  sensitive = true
}

output "loki_url" {
  value = grafana_cloud_stack.mdekort.logs_url
}

output "prometheus_url" {
  value = grafana_cloud_stack.mdekort.prometheus_url
}
