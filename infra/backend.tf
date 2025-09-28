terraform {
  backend "s3" {
    bucket = "sheck-bucket"
    region = "eu-north-1"
    key    = "aws-ecr/terraform.tfstate"
  }
}