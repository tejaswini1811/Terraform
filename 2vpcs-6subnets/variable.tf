variable "region" {
  type = string

}
variable "vpcs_info" {
  type = object({
    name = list(string)
    cidr_block = list(string)
  })

}
variable "primary_subnets_info" {
  type = object({
    name = list(string)
    cidr_block = list(string)
    availability_zone  = list(string)

  })

}
variable "sec_subnets_info" {
  type = object({
    name = list(string)
    cidr_block = list(string)
    availability_zone  = list(string)

  })

}