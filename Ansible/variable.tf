variable "region" {
  type = string
}
variable "availability_zone" {
  type = list(string)
}
variable "sg_name" {
  type = string
}
variable "instances_info" {
  type = map(object({
    instance_type     = string
    key_name          = string
    user_data         = string
    availability_zone = string
  }))
}
variable "null" {
  type = string
}