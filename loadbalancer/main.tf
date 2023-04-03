resource "aws_instance" "instances" {
  for_each          = var.instances_info
  ami               = data.aws_ami_ids.ubuntu.ids[0]
  instance_type     = each.value.instance_type
  key_name          = each.value.key_name
  availability_zone = each.value.availability_zone
  security_groups   = [data.aws_security_group.all_clear.name]
  user_data         = file(each.value.user_data)
  tags = {
    "Name" = each.key
  }
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
  for_each         = var.instances_info
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.instances[each.key].id
  port             = each.value.port
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