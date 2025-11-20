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

resource "aws_cognito_user_pool_client" "grafana" {
  name         = "grafana"
  user_pool_id = data.terraform_remote_state.cloudsetup.outputs.auth_user_pool_id

  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows                  = ["code", "implicit"]
  allowed_oauth_scopes                 = ["email", "openid"]
  supported_identity_providers         = ["COGNITO"]
  generate_secret                      = true

  token_validity_units {
    access_token  = "minutes"
    id_token      = "minutes"
    refresh_token = "hours"
  }

  access_token_validity  = 5
  id_token_validity      = 5
  refresh_token_validity = 24

  explicit_auth_flows = [
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH"
  ]

  callback_urls = [
    "https://mdekort.grafana.net/login/generic_oauth"
  ]
}

resource "grafana_sso_settings" "mdekort" {
  provider = grafana.mdekort

  provider_name = "generic_oauth"

  oauth2_settings {
    name                = "mdekort"
    auth_url            = "https://auth.mdekort.nl/oauth2/authorize"
    token_url           = "https://auth.mdekort.nl/oauth2/token"
    api_url             = "https://auth.mdekort.nl/oauth2/userInfo"
    client_id           = aws_cognito_user_pool_client.grafana.id
    client_secret       = aws_cognito_user_pool_client.grafana.client_secret
    allow_sign_up       = true
    auto_login          = false
    scopes              = "email openid"
    use_pkce            = true
    use_refresh_token   = true
    skip_org_role_sync  = true
    role_attribute_path = "'Admin'"
  }
}
