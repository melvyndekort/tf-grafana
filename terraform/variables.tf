variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "stack_name" {
  description = "Grafana Cloud stack name"
  type        = string
}

variable "stack_slug" {
  description = "Grafana Cloud stack slug"
  type        = string
}

variable "stack_region" {
  description = "Grafana Cloud stack region"
  type        = string
}

variable "stack_description" {
  description = "Grafana Cloud stack description"
  type        = string
}

variable "tfstate_bucket" {
  description = "S3 bucket for Terraform state"
  type        = string
}

variable "cognito_callback_url" {
  description = "Cognito callback URL for Grafana"
  type        = string
}

variable "oauth_auth_url" {
  description = "OAuth authorization URL"
  type        = string
}

variable "oauth_token_url" {
  description = "OAuth token URL"
  type        = string
}

variable "oauth_api_url" {
  description = "OAuth API URL"
  type        = string
}
