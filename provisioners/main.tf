resource "aws_instance" "instances" {
  count = length(var.instances_info.name)
  ami               = data.aws_ami_ids.ubuntu.ids[0]
  instance_type     = var.instances_info.instance_type
  key_name          = var.instances_info.key_name
  availability_zone = var.availability_zone[count.index]
  security_groups   = [data.aws_security_group.all_clear.name]
    tags = {
    "Name" = var.instances_info.name[count.index]
  }
}
resource "null_resource" "chaitanya" {
   triggers = {
    instance = var.chaitanya
  }
  connection {
    host        = aws_instance.instances[0].public_ip
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    type        = "ssh"
  }
    provisioner "file" {
    source      = "nginx.sh"
    destination = "/tmp/nginx.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "sh /tmp/nginx.sh"
    ]
  }
    depends_on = [
    aws_instance.instances
  ]
}
resource "null_resource" "teju" {
    triggers = {
    instance_ids = var.teju
  }
  connection {
    host        = aws_instance.instances[1].public_ip
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    type        = "ssh"
  }
  provisioner "remote-exec" {
    inline = [
      " sudo apt update",
       "sudo apt install apache2 -y"
    ]
  }
    depends_on = [
    aws_instance.instances
  ]
}
resource "aws_lb_target_group" "tg" {
  name        = "tf-lb-tg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = data.aws_vpc.default.id
  depends_on = [
    aws_instance.instances
  ]
}
resource "aws_lb_target_group_attachment" "attachment" {
  count = length(var.instances_info.name)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.instances[count.index].id
  port             = 80
  depends_on = [
    aws_lb_target_group.tg
  ]
}
resource "aws_lb" "lb" {
  name               = "tf-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_security_group.all_clear.id]
  subnet_mapping {
    subnet_id = data.aws_subnet.default_subnets[0].id
  }
  subnet_mapping {
    subnet_id = data.aws_subnet.default_subnets[1].id
  }
  depends_on = [
    aws_instance.instances,
    aws_lb_target_group.tg,
    aws_lb_target_group_attachment.attachment
  ]
}
resource "aws_lb_listener" "lb-listener" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.tg.arn
    type             = "forward"
  }
  depends_on = [
    aws_instance.instances,
    aws_lb.lb,
    aws_lb_target_group.tg,
    aws_lb_target_group_attachment.attachment
  ]
}