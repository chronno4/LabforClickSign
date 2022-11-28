#
# outputs
#

output "project_name_nginx" {
  value = var.project_name_nginx
}

output "region" {
  value = var.region
}

output "ecr_image" {
  value = var.ecr_image
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "alb_dns_name_nginx" {
  value = "http://${aws_alb.alb_nginx.dns_name}"
}

output "alb_dns_name_rails" {
  value = "http://${aws_alb.alb_rails.dns_name}"
}
output "security_group_alb_nginx" {
  value = aws_security_group.alb_nginx.id
}

output "security_group_alb_rails" {
  value = aws_security_group.alb_rails.id
}

output "security_group_ecs_tasks_nginx" {
  value = aws_security_group.ecs_tasks_nginx.id
}

output "security_group_ecs_tasks_rails" {
  value = aws_security_group.ecs_tasks_rails.id
}

output "log_group" {
  value = "https://console.aws.amazon.com/cloudwatch/home?region=${var.region}#logsV2:log-groups/log-group/${aws_cloudwatch_log_group.log_group.name}"
}