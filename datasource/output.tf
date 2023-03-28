output "vpc_id" {
  value = data.aws_vpc.default.id
}
output "security_group_id" {
  value = aws_security_group.terraformsg.id

}