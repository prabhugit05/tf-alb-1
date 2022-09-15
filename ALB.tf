resource "aws_lb_target_group" "lb-tg" {
  name        = "tf-ALB-TG"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id
   health_check {
    path = "/index.html"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
  }
}
resource "aws_lb" "alb" {
  name               = "tf-ALB"
  internal           = false
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = local.pub_sub_ids
  enable_deletion_protection = true
   tags = {
   Environment = "test"
  }
}
resource "aws_lb_listener" "lis_rule" {
  load_balancer_arn = aws_lb.alb.arn
  /*ssl_policy        = "ELBSecurityPolicy-2016-08"*/
  port              = "80"
  protocol          = "HTTP"
  /*default_action {
    type = "redirect"
    redirect {
         port              = "443"
         protocol          = "HTTPS"
         status_code       = "HTTP_301"
    }
  }*/
   default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb-tg.arn
    }
}
