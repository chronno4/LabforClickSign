# resource "aws_alb" "alb_nginx" {
#   name               = "nginx-${var.Env}"
#   load_balancer_type = "application"
#   subnets            = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]
#   security_groups    = [aws_security_group.alb_nginx.id]

# }

# resource "aws_alb_target_group" "alb_target_group_nginx" {
#   name        = "nginx-${var.Env}"
#   port        = 80
#   protocol    = "HTTP"
#   vpc_id      = aws_vpc.vpc.id
#   target_type = "ip"
#   lifecycle {
#     create_before_destroy = true
#   }
#   deregistration_delay = "60"
#   depends_on           = ["aws_alb.alb_nginx"]

#   health_check {
#     path                = "/elb-status"
#     healthy_threshold   = 2
#     unhealthy_threshold = 10
#     timeout             = 5
#     interval            = 10
#     matcher             = "200-399"
#   }
# }

# resource "aws_alb_listener" "alb_listener_nginx" {
#   load_balancer_arn = aws_alb.alb_nginx.arn
#   port              = 80
#   protocol          = "HTTP"
#   default_action {
#     target_group_arn = aws_alb_target_group.alb_target_group_nginx.arn
#     type             = "forward"
#   }
# }


# resource "aws_alb" "alb_rails" {
#   name               = "rails-${var.Env}"
#   load_balancer_type = "application"
#   subnets            = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]
#   security_groups    = [aws_security_group.alb_rails.id]

# }

# resource "aws_alb_target_group" "alb_target_group_rails" {
#   name        = "rails-${var.Env}"
#   port        = 3000
#   protocol    = "HTTP"
#   vpc_id      = aws_vpc.vpc.id
#   target_type = "ip"
#   lifecycle {
#     create_before_destroy = true
#   }
# }
# #
# resource "aws_alb_listener" "alb_listener_rails" {
#   load_balancer_arn = aws_alb.alb_rails.arn
#   port              = 3000
#   protocol          = "HTTP"
#   default_action {
#     target_group_arn = aws_alb_target_group.alb_target_group_rails.arn
#     type             = "forward"
#   }
# }