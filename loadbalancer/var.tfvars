region            = "us-west-2"
availability_zone = ["us-west-2a", "us-west-2b"]
sg_name           = "allclear"
instances_info = {
  "nginx" = {
    instance_type     = "t2.micro"
    key_name          = "impkey"
    availability_zone = "us-west-2a"
    user_data         = "nginx.sh"
    port              = 80
  }
  "apache2" = {
    instance_type     = "t2.micro"
    key_name          = "impkey"
    availability_zone = "us-west-2b"
    user_data         = "apache2.sh"
    port              = 80
  }
}
