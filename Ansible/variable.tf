variable "region" {
  type    = string
  default = "us-west-2"
}

variable "availability_zone" {
  type    = list(string)
  default = ["us-west-2a", "us-west-2b"]
}
variable "sg_name" {
  type    = string
  default = "allclear"
}
variable "instances_info" {
  type = map(object({
    instance_type     = string
    key_name          = string
    user_data         = string
    availability_zone = string
  }))
  default = {
    "ansible" = {
      instance_type     = "t2.micro"
      key_name          = "impkey"
      availability_zone = "us-west-2a"
      user_data         = "ansible.sh"
    }
  }
}
variable "null" {
  type    = string
  default = "1111"
}