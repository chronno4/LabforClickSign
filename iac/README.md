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
| [aws_ecr_lifecycle_policy.nginx-app](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_lifecycle_policy.rails-app](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.nginx-app](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository.rails-app](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository_policy.nginx-app](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/ecr_repository_policy) | resource |
| [aws_ecr_repository_policy.rails-app](https://registry.terraform.io/providers/hashicorp/aws/3.44.0/docs/resources/ecr_repository_policy) | resource |

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

No outputs.
<!-- END_TF_DOCS -->