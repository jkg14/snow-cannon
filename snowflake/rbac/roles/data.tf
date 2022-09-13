data "terraform_remote_state" "user_info" {
  backend = "s3"
  config = {
    bucket = "glasgow-cannon-3-remote-state"
    key    = "env:/${terraform.workspace}/snowflake/rbac/users/terraform.tfstate"
    region = "us-east-1"
  }
}
