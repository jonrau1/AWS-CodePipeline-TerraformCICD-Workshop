terraform {
  backend "s3" {
  encrypt = true
  bucket = ""
  dynamodb_table = ""
  region = ""
  key = "PATH/TO/FILE/terraform.tfstate"
  }
}
