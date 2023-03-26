resource "random_password" "terra_pass"{
    length  = var.password_info.length
    special = true
    override_special = var.password_info.override_special
}
resource "aws_db_instance" "rds" {
    allocated_storage = var.rds_info.allocated_storage
    db_name = var.rds_info.db_name
    engine = var.rds_info.engine
    engine_version = var.rds_info.engine_version
    instance_class = var.rds_info.instance_class
    username = var.rds_info.username
    password = random_password.terra_pass.result
    skip_final_snapshot = true
}