region            = "us-west-2"
availability_zone = ["us-west-2a", "us-west-2b"]
sg_name           = "allclear"
instances_info = {
  instance_type = "t2.micro"
  key_name = "impkey"
  name = [ "nginx","apache2" ]
}
chaitanya = "0"
teju = "0"