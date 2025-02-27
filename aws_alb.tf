resource "aws_lb" "bia" {
  name               = "bia-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [local.subnet_zona_a,local.subnet_zona_b]
  security_groups    = [aws_security_group.bia_alb.id] 
}

resource "aws_lb_target_group" "tg-bia" {
  name_prefix = "tgbia-"
  vpc_id      = local.vpc_id
  protocol    = "HTTP"
  port        = 80
  target_type = "instance"
  deregistration_delay = 30

  health_check {
    enabled             = true
    path                = "/api/versao"
    matcher             = 200
    interval            = 10
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 3
  }
}

resource "aws_lb_listener" "bia" {
    load_balancer_arn = aws_lb.bia.id
    port              = 80
    protocol          = "HTTP"

    default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-bia.id
    }
}

resource "aws_lb_listener" "https_bia" {
    load_balancer_arn = aws_lb.bia.arn
    port              = 443
    protocol          = "HTTPS"
    ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
    certificate_arn   = "arn:aws:acm:us-east-1:767397833843:certificate/6fd24181-ebd5-4a6c-a645-9da14ce486b8"

    default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-bia.id
  }
}

output "alb_url" {
  value = aws_lb.bia.dns_name
}