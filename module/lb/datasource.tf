data "aws_vpc" "default" {
  default = true
}
data "aws_subnet" "default_subnets" {
  count             = length(var.availability_zone)
  vpc_id            = data.aws_vpc.default.id
  availability_zone = var.availability_zone[count.index]
}
data "aws_security_group" "all_clear" {
  vpc_id = data.aws_vpc.default.id
  filter {
    name   = "tag-key"
    values = ["Name"]
  }
  filter {
    name   = "tag-value"
    values = [var.sg_name]
  }
}
data "aws_ami_ids" "ubuntu" {
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230325"]
  }
} 