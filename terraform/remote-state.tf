data "terraform_remote_state" "cloudsetup" {
  backend = "s3"
  config = {
    bucket = var.tfstate_bucket
    key    = "cloudsetup.tfstate"
    region = var.aws_region
  }
}
