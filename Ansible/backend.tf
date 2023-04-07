data "aws_s3_bucket" "ansible1811" {
  bucket = "ansible1811"
}
terraform {
  backend "s3" {
    bucket         = "ansible1811"
    key            = "terraform/terraform.tfstate"
    region         = "us-west-2"
  }
}