data "terraform_remote_state" "role_info" {
  backend = "s3"
  config = {
    bucket = "glasgow-cannon-1-remote-state"
    key    = "env:/${terraform.workspace}/snowflake/rbac/roles/terraform.tfstate"
    region = module.config.entries.providers.aws_region
  }
}
