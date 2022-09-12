module "example_pipe" {
  source         = "../../../modules/snowpipe-module/"
  s3_bucket_name = "glasgow-cannon-2-data-lake-${local.config.env_formatted.lower}"
  s3_path        = "transactions"
  database       = "ANALYTICS"
  schema         = "PUBLIC"
  file_format    = "CSV"
  field_delimiter  = ","
  record_delimiter = "\n"
}
