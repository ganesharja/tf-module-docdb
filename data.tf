# Reads the information from the remote statefile
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "b55-terraform-state-ganesh"
    key    = "databases/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
  }
}