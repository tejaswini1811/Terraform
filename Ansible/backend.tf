data "aws_s3_bucket" "spc1811" {
  bucket = "spc1811"
}
terraform {
  backend "s3" {
    bucket         = "spc1811"
    key            = "terraform/terraform.tfstate"
    region         = "ap-northeast-2"
  }
}