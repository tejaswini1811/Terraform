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
  type = object({
    instance_type     = string
    key_name          = string
    name = list(string)
    })
}
variable "chaitanya" {
  type = string
}
variable "teju" {
  type = string
}