
## LAB - Frontend ##
#####################################
# nginx MS #
#####################################
#########
#
#########
resource "aws_ecr_repository" "nginx-app" {
  name                 = "nginx-app-${var.ecr_registry_type[var.Env]}"
  image_tag_mutability = "MUTABLE" # SNAPSHOT
  image_scanning_configuration {
    scan_on_push = false
  }
}
# Em Principal informe as contas AWS que devem possuir acesso ao repositorio

resource "aws_ecr_repository_policy" "nginx-app" {
  repository = aws_ecr_repository.nginx-app.name
  policy     = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
       {
           "Sid": "adds full ecr access to the ${var.ecr_registry_type[var.Env]} repository",
           "Effect": "Allow",
           "Principal": {
             "AWS": [
               "arn:aws:iam::788615289429:root"
             ]
           },
           "Action": [
               "ecr:BatchCheckLayerAvailability",
               "ecr:BatchGetImage",
               "ecr:CompleteLayerUpload",
               "ecr:GetDownloadUrlForLayer",
               "ecr:InitiateLayerUpload",
               "ecr:PutImage",
               "ecr:UploadLayerPart"
           ]
       }
   ]
}
EOF
}


resource "aws_ecr_lifecycle_policy" "nginx-app" {
  repository = aws_ecr_repository.nginx-app.name

  policy = <<EOF
{
   "rules": [
       {
           "rulePriority": 1,
           "description": "Expire images older than 14 days",
           "selection": {
               "tagStatus": "untagged",
               "countType": "sinceImagePushed",
               "countUnit": "days",
               "countNumber": 14
           },
           "action": {
               "type": "expire"
           }
       }
   ]
}
EOF
}


## LAB - Frontend ##
#####################################
# rails MS #
#####################################
#########

#########
resource "aws_ecr_repository" "rails-app" {
  name                 = "rails-app-${var.ecr_registry_type[var.Env]}"
  image_tag_mutability = "MUTABLE" # SNAPSHOT
  image_scanning_configuration {
    scan_on_push = false
  }
}


resource "aws_ecr_repository_policy" "rails-app" {
  repository = aws_ecr_repository.rails-app.name
  policy     = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
       {
           "Sid": "adds full ecr access to the ${var.ecr_registry_type[var.Env]} repository",
           "Effect": "Allow",
           "Principal": {
             "AWS": [
               "arn:aws:iam::788615289429:root"
             ]
           },
           "Action": [
               "ecr:BatchCheckLayerAvailability",
               "ecr:BatchGetImage",
               "ecr:CompleteLayerUpload",
               "ecr:GetDownloadUrlForLayer",
               "ecr:InitiateLayerUpload",
               "ecr:PutImage",
               "ecr:UploadLayerPart"
           ]
       }
   ]
}
EOF
}

resource "aws_ecr_lifecycle_policy" "rails-app" {
  repository = aws_ecr_repository.rails-app.name

  policy = <<EOF
{
   "rules": [
       {
           "rulePriority": 1,
           "description": "Expire images older than 14 days",
           "selection": {
               "tagStatus": "untagged",
               "countType": "sinceImagePushed",
               "countUnit": "days",
               "countNumber": 14
           },
           "action": {
               "type": "expire"
           }
       }
   ]
}
EOF
}
