module "example_pipe" {
  source         = "../../../modules/snowpipe-module/"
  s3_bucket_name = "glasgow-cannon-data-lake-${local.config.env_formatted.lower}"
  s3_path        = "transactions"
  database       = "ANALYTICS"
  schema         = "PUBLIC"
}
