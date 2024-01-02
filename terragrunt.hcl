remote_state {
  backend = "s3"
  config = {
    bucket         = "omprakash-terraform-state-bucket"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "ap-southeast-2"
    encrypt        = true
    dynamodb_table = "omprakash-terraform-lock-table"
  }
}
