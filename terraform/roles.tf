
data "grafana_role" "datasources_reader" {
  provider = grafana.mdekort
  name     = "fixed:datasources:reader"

  depends_on = [grafana_cloud_stack_service_account_token.terraform]
}

resource "grafana_role_assignment" "email_infra_datasources_reader" {
  provider = grafana.mdekort

  role_uid         = data.grafana_role.datasources_reader.uid
  service_accounts = [grafana_cloud_stack_service_account.email_infra.id]

  depends_on = [grafana_cloud_stack_service_account_token.terraform]
}
