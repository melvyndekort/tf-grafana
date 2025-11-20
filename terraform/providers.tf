terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "~> 4.8"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket       = "mdekort.tfstate"
    key          = "tf-grafana.tfstate"
    region       = "eu-west-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = "eu-west-1"
}

provider "grafana" {
  alias = "cloud"

  cloud_access_policy_token = local.secrets.grafana.cloud_token
}

provider "grafana" {
  alias = "mdekort"

  url  = grafana_cloud_stack.mdekort.url
  auth = grafana_cloud_stack_service_account_token.terraform.key
}
