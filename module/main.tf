module "lb" {
  source            = "./lb"
  region            = "us-west-2"
  sg_name           = "allclear"
  availability_zone = ["us-west-2a", "us-west-2b"]
  instances_info = {
    instance_type = "t2.micro"
    key_name      = "impkey"
    name          = ["nginx", "apache2"]
  }
  chaitanya = "1"
  teju      = "18"
}
output "vpc_id" {
  value = module.lb.vpc_id
}
output "subnet1_id" {
  value = module.lb.subnet1_id
}
output "subnet2_id" {
  value = module.lb.subnet2_id
}
output "securirty_group_id" {
  value = module.lb.securirty_group_id
}
output "ami_id" {
  value = module.lb.ami_id
}
output "ngnix_ip" {
  value = module.lb.ngnix_ip
}
output "apache2_ip" {
  value = module.lb.apache2_ip
}
output "load_balancer" {
  value = module.lb.load_balancer
}
