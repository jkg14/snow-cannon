terraform {
  required_version = ">= 1.2.8"

  backend "s3" {
    profile        = "aws-dev"
    bucket         = "glasgow-cannon-1-remote-state"
    dynamodb_table = "glasgow-cannon-1-lock-table"
    key            = "aws/iam/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }

  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.43.0"
    }
  }
}
