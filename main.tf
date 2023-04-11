data "aws_vpc" "default" {
  default = true
}
data "aws_subnet" "default_subnets" {
  count             = length(var.availability_zone)
  vpc_id            = data.aws_vpc.default.id
  availability_zone = var.availability_zone[count.index]
}
data "aws_security_group" "all_clear" {
  vpc_id = data.aws_vpc.default.id
  filter {
    name   = "tag-key"
    values = ["Name"]
  }
  filter {
    name   = "tag-value"
    values = [var.sg_name]
  }
}
data "aws_ami_ids" "ubuntu" {
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230325"]
  }
}
resource "aws_instance" "instances" {
  for_each          = var.instances_info
  ami               = data.aws_ami_ids.ubuntu.ids[0]
  instance_type     = each.value.instance_type
  key_name          = each.value.key_name
  availability_zone = each.value.availability_zone
  security_groups   = [data.aws_security_group.all_clear.name]
 # user_data         = file(each.value.user_data)
  tags = {
    "Name" = each.key
  }
}
resource "null_resource" "null" {
  for_each = var.instances_info
  triggers = {
    instance = var.null
  }
  connection {
    host        = aws_instance.instances[each.key].public_ip
    user        = "ubuntu"
    private_key = file("/home/ubuntu/.ssh/id_rsa")
    type        = "ssh"
  }
  provisioner "file" {
    source      = "ansible.sh"
    destination = "/tmp/ansible.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "sh /tmp/ansible.sh"
      
    ]
  }
  depends_on = [
    aws_instance.instances
  ]
}