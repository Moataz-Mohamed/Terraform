terraform {
  backend "s3" {
    bucket = "terraformstarte5060"
    key    = "terraform/bachend"
    region = "us-east-1"


  }
}