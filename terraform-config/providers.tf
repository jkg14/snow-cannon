locals {
  environment = {
    dev = {
      name       = "dev"
      group_name = "nonprod"

      aws_account = {
        id      = "632610202813"
        region  = "us-east-1"
        profile = "aws-dev"
      }

      snowflake_account = {
        id     = "TA20845"
        region = "eu-west-1"
      }
    }
    providers = {
      snowflake_version = "0.43.0"
      aws_version       = "~> 3.5.0"
    }
  }
}
