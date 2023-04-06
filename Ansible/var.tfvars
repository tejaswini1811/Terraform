region            = "us-west-2"
availability_zone = ["us-west-2a", "us-west-2b"]
sg_name           = "allclear"
instances_info = {
  "ansible" = {
    instance_type     = "t2.micro"
    key_name          = "impkey"
    availability_zone = "us-west-2a"
    user_data         = "ansible.sh"
  }
}
null = "11"