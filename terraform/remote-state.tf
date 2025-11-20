data "terraform_remote_state" "tf_cognito" {
  backend = "s3"
  config = {
    bucket = var.tfstate_bucket
    key    = "tf-cognito.tfstate"
    region = var.aws_region
  }
}
