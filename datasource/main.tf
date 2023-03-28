data "aws_vpc" "default" {
  default = true
  filter {
    name = "tag-key"
    values = ["Name"]
  }
  filter {
    name ="tag-value"
    values = [var.vpc_name]
  }
}
resource "aws_security_group" "terraformsg" {
  name        = "terraformsg"
  description = "form terraform"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "terraform_sg"
  }

}