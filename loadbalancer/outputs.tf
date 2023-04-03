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
output "ngnix_ip" {
  value = "http://${aws_instance.instances["nginx"].public_ip}"
}
output "apache2_ip" {
  value = "http://${aws_instance.instances["apache2"].public_ip}"
}
output "load_balancer" {
  value = "http://${aws_lb.lb.dns_name}"
}
