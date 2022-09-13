terraform {
  required_version = ">= 1.2.8"

  backend "s3" {
    profile        = "aws-dev"
    bucket         = "glasgow-cannon-3-remote-state"
    dynamodb_table = "glasgow-cannon-3-lock-table"
    key            = "snowflake/infra/warehouses/terraform.tfstate"
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
