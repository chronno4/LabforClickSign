# resource "aws_ecs_cluster" "ecs_cluster" {
#   name = "ecs-cluster-${var.Env}"
# }

# resource "aws_cloudwatch_log_group" "log_group" {
#   name = "lab-log-group"
# }


# ########################################################################
# ######################### Task nginx ###################################
# ########################################################################
# resource "aws_ecs_task_definition" "task_definition_nginx" {
#   family                = var.project_name_nginx
#   container_definitions = <<DEFINITION
# [{
#     "name": "nginx-app",
#     "image": "788615289429.dkr.ecr.us-east-1.amazonaws.com/nginx-app${var.ecr_registry_type[var.Env]}:${var.nginx-app_image_version}",
#     "cpu": 0,
#     "essential": true,
#     "networkMode": "awsvpc",
#     "environment": [
#       {
#         "name": "SERVER_NAME",
#         "value": "${var.project_name_nginx}"
#       },
#       {
#         "name": "URL_RAILS",
#         "value": "${aws_alb.alb_rails.dns_name}"
#       }
#     ],
#     "portMappings": [
#         {
#             "containerPort": 80,
#             "hostPort": 80,
#             "protocol": "tcp"
#         }
#     ],
#     "privileged": false,
#     "readonlyRootFilesystem": false,
#     "logConfiguration": {
#         "logDriver": "awslogs",
#         "options": {
#             "awslogs-group": "${aws_cloudwatch_log_group.log_group.name}",
#             "awslogs-region": "${var.region}",
#             "awslogs-stream-prefix": "site"
#         }
#     }
# }]
# DEFINITION

#   execution_role_arn       = aws_iam_role.fargate.arn
#   network_mode             = "awsvpc"
#   requires_compatibilities = ["FARGATE"]
#   cpu                      = 256
#   memory                   = 512
# }

# resource "aws_ecs_service" "ecs_service_nginx" {
#   name                = var.project_name_nginx
#   cluster             = aws_ecs_cluster.ecs_cluster.id
#   task_definition     = aws_ecs_task_definition.task_definition_nginx.arn
#   launch_type         = "FARGATE"
#   desired_count       = var.desired_count
#   scheduling_strategy = "REPLICA"

#   network_configuration {
#     subnets          = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]
#     security_groups  = [aws_security_group.ecs_tasks_nginx.id, aws_security_group.alb_nginx.id]
#     assign_public_ip = true
#   }

#   load_balancer {
#     target_group_arn = aws_alb_target_group.alb_target_group_nginx.arn
#     container_name   = "nginx-app"
#     container_port   = 80
#   }

#   depends_on = [aws_alb_listener.alb_listener_nginx]
# }

# ########################################################################
# ######################### Task rails ###################################
# ########################################################################
# resource "aws_ecs_task_definition" "task_definition_rails" {
#   family                = var.project_name_rails
#   container_definitions = <<DEFINITION
# [{
#     "name": "rails-app",
#     "image": "788615289429.dkr.ecr.us-east-1.amazonaws.com/rails-app${var.ecr_registry_type[var.Env]}:${var.rails-app_image_version}",
#     "cpu": 0,
#     "essential": true,
#     "networkMode": "awsvpc",
#     "portMappings": [
#         {
#             "containerPort": 3000,
#             "hostPort": 3000,
#             "protocol": "tcp"
#         }
#     ],
#     "privileged": false,
#     "readonlyRootFilesystem": false,
#     "logConfiguration": {
#         "logDriver": "awslogs",
#         "options": {
#             "awslogs-group": "${aws_cloudwatch_log_group.log_group.name}",
#             "awslogs-region": "${var.region}",
#             "awslogs-stream-prefix": "site2"
#         }
#     }
# }]
# DEFINITION

#   execution_role_arn       = aws_iam_role.fargate.arn
#   network_mode             = "awsvpc"
#   requires_compatibilities = ["FARGATE"]
#   cpu                      = 256
#   memory                   = 512
# }

# resource "aws_ecs_service" "ecs_service" {
#   name                = var.project_name_rails
#   cluster             = aws_ecs_cluster.ecs_cluster.id
#   task_definition     = aws_ecs_task_definition.task_definition_rails.arn
#   launch_type         = "FARGATE"
#   desired_count       = var.desired_count
#   scheduling_strategy = "REPLICA"

#   network_configuration {
#     subnets          = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]
#     security_groups  = [aws_security_group.ecs_tasks_rails.id, aws_security_group.alb_rails.id]
#     assign_public_ip = true
#   }

#   load_balancer {
#     target_group_arn = aws_alb_target_group.alb_target_group_rails.arn
#     container_name   = "rails-app"
#     container_port   = 3000
#   }

#   depends_on = [aws_alb_listener.alb_listener_rails]
# }

# #