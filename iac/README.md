<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 0.15.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.44.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.44.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_alb.alb_nginx](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/alb) | resource |
| [aws_alb.alb_rails](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/alb) | resource |
| [aws_alb_listener.alb_listener_nginx](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/alb_listener) | resource |
| [aws_alb_listener.alb_listener_rails](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/alb_listener) | resource |
| [aws_alb_target_group.alb_target_group_nginx](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/alb_target_group) | resource |
| [aws_alb_target_group.alb_target_group_rails](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/alb_target_group) | resource |
| [aws_cloudwatch_log_group.log_group](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_ecr_lifecycle_policy.nginx-app](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_lifecycle_policy.rails-app](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.nginx-app](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository.rails-app](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository_policy.nginx-app](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/ecr_repository_policy) | resource |
| [aws_ecr_repository_policy.rails-app](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/ecr_repository_policy) | resource |
| [aws_ecs_cluster.ecs_cluster](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/ecs_cluster) | resource |
| [aws_ecs_service.ecs_service](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/ecs_service) | resource |
| [aws_ecs_service.ecs_service_nginx](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.task_definition_nginx](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/ecs_task_definition) | resource |
| [aws_ecs_task_definition.task_definition_rails](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/ecs_task_definition) | resource |
| [aws_iam_access_key.publisher](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/iam_access_key) | resource |
| [aws_iam_role.fargate](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.fargate](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/iam_role_policy) | resource |
| [aws_iam_user.publisher](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.publisher](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/iam_user_policy) | resource |
| [aws_internet_gateway.internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/internet_gateway) | resource |
| [aws_route_table.route_table](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/route_table) | resource |
| [aws_route_table_association.route_table_association_1](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.route_table_association_2](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/route_table_association) | resource |
| [aws_security_group.alb_nginx](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/security_group) | resource |
| [aws_security_group.alb_rails](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/security_group) | resource |
| [aws_security_group.ecs_tasks_nginx](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/security_group) | resource |
| [aws_security_group.ecs_tasks_rails](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/security_group) | resource |
| [aws_subnet.subnet_1](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/subnet) | resource |
| [aws_subnet.subnet_2](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_Env"></a> [Env](#input\_Env) | The environment to deploy to | `string` | `"dev"` | no |
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | The AWS profile to use to execute the commands | `string` | `"default"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | `"us-east-1"` | no |
| <a name="input_cidr_block_1"></a> [cidr\_block\_1](#input\_cidr\_block\_1) | n/a | `map(string)` | <pre>{<br>  "dev": "10.0.0.0/24",<br>  "prd": "10.1.0.0/24"<br>}</pre> | no |
| <a name="input_cidr_block_2"></a> [cidr\_block\_2](#input\_cidr\_block\_2) | n/a | `map(string)` | <pre>{<br>  "dev": "10.0.1.0/24",<br>  "prd": "10.1.1.0/24"<br>}</pre> | no |
| <a name="input_cidr_block_vpc"></a> [cidr\_block\_vpc](#input\_cidr\_block\_vpc) | n/a | `map(string)` | <pre>{<br>  "dev": "10.0.0.0/23",<br>  "prd": "10.1.0.0/23"<br>}</pre> | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | n/a | `number` | `1` | no |
| <a name="input_ecr_image"></a> [ecr\_image](#input\_ecr\_image) | n/a | `string` | `""` | no |
| <a name="input_ecr_registry_type"></a> [ecr\_registry\_type](#input\_ecr\_registry\_type) | n/a | `map(string)` | <pre>{<br>  "dev": "-snapshot",<br>  "prd": ""<br>}</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment to deploy to | `string` | `"dev"` | no |
| <a name="input_nginx-app_image_version"></a> [nginx-app\_image\_version](#input\_nginx-app\_image\_version) | variables | `string` | `"0b81f74"` | no |
| <a name="input_profile"></a> [profile](#input\_profile) | n/a | `string` | `"default"` | no |
| <a name="input_project_name_nginx"></a> [project\_name\_nginx](#input\_project\_name\_nginx) | n/a | `string` | `"nginx_app"` | no |
| <a name="input_project_name_rails"></a> [project\_name\_rails](#input\_project\_name\_rails) | n/a | `string` | `"rails_app"` | no |
| <a name="input_rails-app_image_version"></a> [rails-app\_image\_version](#input\_rails-app\_image\_version) | n/a | `string` | `"3135f57"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_dns_name_nginx"></a> [alb\_dns\_name\_nginx](#output\_alb\_dns\_name\_nginx) | n/a |
| <a name="output_alb_dns_name_rails"></a> [alb\_dns\_name\_rails](#output\_alb\_dns\_name\_rails) | n/a |
| <a name="output_ecr_image"></a> [ecr\_image](#output\_ecr\_image) | n/a |
| <a name="output_log_group"></a> [log\_group](#output\_log\_group) | n/a |
| <a name="output_project_name_nginx"></a> [project\_name\_nginx](#output\_project\_name\_nginx) | n/a |
| <a name="output_region"></a> [region](#output\_region) | n/a |
| <a name="output_security_group_alb_nginx"></a> [security\_group\_alb\_nginx](#output\_security\_group\_alb\_nginx) | n/a |
| <a name="output_security_group_alb_rails"></a> [security\_group\_alb\_rails](#output\_security\_group\_alb\_rails) | n/a |
| <a name="output_security_group_ecs_tasks_nginx"></a> [security\_group\_ecs\_tasks\_nginx](#output\_security\_group\_ecs\_tasks\_nginx) | n/a |
| <a name="output_security_group_ecs_tasks_rails"></a> [security\_group\_ecs\_tasks\_rails](#output\_security\_group\_ecs\_tasks\_rails) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
<!-- END_TF_DOCS -->