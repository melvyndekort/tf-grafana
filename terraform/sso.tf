resource "grafana_sso_settings" "github" {
  provider = grafana.mdekort

  provider_name = "github"

  oauth2_settings {
    name                = "GitHub"
    client_id           = local.secrets.grafana.github_client_id
    client_secret       = local.secrets.grafana.github_client_secret
    allow_sign_up       = true
    auto_login          = false
    scopes              = "user:email,read:org"
    role_attribute_path = "[login=='melvyndekort'][0] && 'Admin' || 'Viewer'"
  }
}

resource "grafana_sso_settings" "mdekort" {
  provider = grafana.mdekort

  provider_name = "generic_oauth"

  oauth2_settings {
    name                = "Authentik"
    auth_url            = "https://auth.mdekort.nl/application/o/authorize/"
    token_url           = "https://auth.mdekort.nl/application/o/token/"
    api_url             = "https://auth.mdekort.nl/application/o/userinfo/"
    client_id           = local.secrets.grafana.authentik_client_id
    client_secret       = local.secrets.grafana.authentik_client_secret
    allow_sign_up       = true
    auto_login          = false
    scopes              = "email openid"
    use_pkce            = true
    use_refresh_token   = true
    skip_org_role_sync  = true
    role_attribute_path = "'Admin'"
  }
}
