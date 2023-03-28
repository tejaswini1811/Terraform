resource "aws_vpc" "vpcs" {
  count      = length(var.vpcs_info.name)
  cidr_block = var.vpcs_info.cidr_block[count.index]
  tags = {
    "Name" = var.vpcs_info.name[count.index]
  }
}
resource "aws_subnet" "primary_subnets" {
  count             = length(var.primary_subnets_info.name)
  vpc_id            = aws_vpc.vpcs[0].id
  cidr_block        = var.primary_subnets_info.cidr_block[count.index]
  availability_zone = var.primary_subnets_info.availability_zone[count.index]
  tags = {
    "Name" = var.primary_subnets_info.name[count.index]
  }

}
resource "aws_subnet" "secs_ubnets" {
  count             = length(var.sec_subnets_info.name)
  vpc_id            = aws_vpc.vpcs[1].id
  cidr_block        = var.sec_subnets_info.cidr_block[count.index]
  availability_zone = var.sec_subnets_info.availability_zone[count.index]
  tags = {
    "Name" = var.sec_subnets_info.name[count.index]
  }

}