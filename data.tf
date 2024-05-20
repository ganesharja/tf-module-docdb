# Reads the information from the remote statefile
data "terraform_remote_state" "docdb" {
  backend = "s3"
  config = {
    bucket = "b55-terraform-state-ganesh"
    key    = "databases/dev/terraform.tfstate" 
    region = "us-east-1"
  }
}

