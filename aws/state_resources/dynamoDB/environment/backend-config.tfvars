bucket         = "snow-cannon-remote-state"
key            = "persistence/dynamodb/terraform.tfstate"
region         = "eu-west-2"
dynamodb_table = "snow-cannon-lock-table"
encrypt        = true