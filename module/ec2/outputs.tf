output "vpc_id" {
  value = data.aws_vpc.default.id
}
output "subnet1_id" {
  value = data.aws_subnet.default_subnets[0].id
}
output "subnet2_id" {
  value = data.aws_subnet.default_subnets[1].id
}
output "securirty_group_id" {
  value = data.aws_security_group.all_clear.id
}
output "ami_id" {
  value = data.aws_ami_ids.ubuntu.ids
}
output "public_ip" {
  for_each = var.instance_info
  value = "http://${aws_instance.instances[each.key].public_ip}"
}


