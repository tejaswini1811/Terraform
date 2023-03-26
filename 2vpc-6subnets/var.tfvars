region = "us-west-2"
vpcs_info = {
  cidr_block =["192.168.0.0/16","10.168.0.0/16"]
  name =["frist_vpc" , "sec_vpc"]
}
primary_subnets_info = {
  cidr_block = [ "192.168.0.0/24","192.168.1.0/24","192.168.2.0/24","192.168.3.0/24","192.168.4.0/24","192.168.5.0/24"]
  name = [ "primary1","primary2","primary3","primary4","primary5","primary6" ]
  availability_zone =[ "us-west-2a","us-west-2a","us-west-2a","us-west-2a","us-west-2a","us-west-2a"]
}
sec_subnets_info = {
  availability_zone = [ "us-west-2c","us-west-2c","us-west-2c","us-west-2c","us-west-2c","us-west-2c" ]
  cidr_block = [ "10.168.0.0/24","10.168.1.0/24","10.168.2.0/24","10.168.3.0/24","10.168.4.0/24","10.168.5.0/24" ]
  name = [ "sec1","sec2","sec3","sec4","sec5","sec6"]
}
