
# ########################################################################
# ######################### SG ngnix #####################################
# ########################################################################

# resource "aws_security_group" "alb_nginx" {
#   name        = "${var.project_name_nginx}-alb-${var.Env}"
#   description = "inbound: 80,443 + outbound: all"
#   vpc_id      = aws_vpc.vpc.id

#   lifecycle {
#     create_before_destroy = true
#   }

#   ingress {
#     protocol    = "tcp"
#     from_port   = 80
#     to_port     = 80
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     protocol    = "tcp"
#     from_port   = 443
#     to_port     = 443
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = -1
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_security_group" "ecs_tasks_nginx" {
#   name        = "${var.project_name_nginx}-ecs-${var.Env}"
#   description = "inbound: 80 from ALB security group + outbound: all"
#   vpc_id      = aws_vpc.vpc.id

#   lifecycle {
#     create_before_destroy = true
#   }

#   ingress {
#     protocol        = "tcp"
#     from_port       = 80
#     to_port         = 80
#     security_groups = [aws_security_group.alb_nginx.id]
#   }

#   egress {
#     protocol    = -1
#     from_port   = 0
#     to_port     = 0
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }


# ########################################################################
# ######################### SG rails #####################################
# ########################################################################
# resource "aws_security_group" "alb_rails" {
#   name        = "${var.project_name_rails}-alb-${var.Env}"
#   description = "inbound: 80,3000 + outbound: all"
#   vpc_id      = aws_vpc.vpc.id

#   lifecycle {
#     create_before_destroy = true
#   }

#   depends_on = [aws_security_group.alb_nginx]
#   ingress {
#     protocol    = "tcp"
#     from_port   = 80
#     to_port     = 80
#     cidr_blocks = ["${var.cidr_block_1[var.Env]}"]
#   }

#   ingress {
#     protocol    = "tcp"
#     from_port   = 80
#     to_port     = 80
#     cidr_blocks = ["${var.cidr_block_2[var.Env]}"]
#   }


#   ingress {
#     protocol    = "tcp"
#     from_port   = 3000
#     to_port     = 3000
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = -1
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_security_group" "ecs_tasks_rails" {
#   name        = "${var.project_name_rails}-ecs-${var.Env}"
#   description = "inbound: 80 from ALB security group + outbound: all"
#   vpc_id      = aws_vpc.vpc.id

#   lifecycle {
#     create_before_destroy = true
#   }

#   ingress {
#     protocol    = "tcp"
#     from_port   = 3000
#     to_port     = 3000
#     cidr_blocks = ["${var.cidr_block_1[var.Env]}"]
#   }
#   ingress {
#     protocol    = "tcp"
#     from_port   = 3000
#     to_port     = 3000
#     cidr_blocks = ["${var.cidr_block_2[var.Env]}"]
#   }

#   egress {
#     protocol    = -1
#     from_port   = 0
#     to_port     = 0
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }