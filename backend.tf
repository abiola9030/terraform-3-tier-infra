terraform {
  backend "s3" {
    bucket = "my-terraform-bucket-00909"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
    workspace_key_prefix  = "env"
  }
}