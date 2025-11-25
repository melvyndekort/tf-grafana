resource "grafana_cloud_stack" "mdekort" {
  provider = grafana.cloud

  name        = var.stack_name
  slug        = var.stack_slug
  region_slug = var.stack_region
  description = var.stack_description
}

resource "grafana_cloud_stack_service_account" "terraform" {
  provider   = grafana.cloud
  stack_slug = grafana_cloud_stack.mdekort.slug

  name = "terraform"
  role = "Admin"
}

resource "grafana_cloud_stack_service_account_token" "terraform" {
  provider   = grafana.cloud
  stack_slug = grafana_cloud_stack.mdekort.slug

  name               = "terraform-key"
  service_account_id = grafana_cloud_stack_service_account.terraform.id
}

resource "grafana_cloud_stack_service_account" "email_infra" {
  provider   = grafana.cloud
  stack_slug = grafana_cloud_stack.mdekort.slug

  name = "email-infra"
  role = "Editor"
}

resource "grafana_cloud_stack_service_account_token" "email_infra" {
  provider   = grafana.cloud
  stack_slug = grafana_cloud_stack.mdekort.slug

  name               = "email-infra-dmarc"
  service_account_id = grafana_cloud_stack_service_account.email_infra.id
}
