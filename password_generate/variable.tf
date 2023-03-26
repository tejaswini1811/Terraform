variable "region"{
    type = string
}
variable "password_info"{
    type = object({
      length = string
      override_special = string
    })
}
variable "rds_info" {
  type = object({
    allocated_storage = string
    db_name = string
    engine = string
    engine_version = string
    username = string
    instance_class = string
  })
}