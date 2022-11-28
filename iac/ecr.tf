
## LAB - Frontend ##
#####################################
# nginx MS #
#####################################
#########
# Develop
#########
resource "aws_ecr_repository" "nginx-app-snapshot" {
  name                 = "nginx-app-snapshot"
  image_tag_mutability = "MUTABLE" # SNAPSHOT
  image_scanning_configuration {
    scan_on_push = false
  }
}
# Em Principal informe as contas AWS que devem possuir acesso ao repositorio
# Account ID 233801601735 (SHARED) deve estar em todos os repositorios
resource "aws_ecr_repository_policy" "nginx-app-snapshot" {
  repository = aws_ecr_repository.nginx-app-snapshot.name
  policy     = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
       {
           "Sid": "AllowPushPull",
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

# Remoção de imagens sem tag após 14 dias
# Essa regra atende 99% dos cenários, só mude se for realmente necessário.
resource "aws_ecr_lifecycle_policy" "nginx-app-snapshot" {
  repository = aws_ecr_repository.nginx-app-snapshot.name

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
#########
# Release
#########
resource "aws_ecr_repository" "nginx-app" {
  name                 = "nginx-app"
  image_tag_mutability = "IMMUTABLE" # RELEASE
  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_repository_policy" "nginx-app" {
  repository = aws_ecr_repository.nginx-app.name
  policy     = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowPushPull",
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
# Develop
#########
resource "aws_ecr_repository" "rails-app-snapshot" {
  name                 = "rails-app-snapshot"
  image_tag_mutability = "MUTABLE" # SNAPSHOT
  image_scanning_configuration {
    scan_on_push = false
  }
}
# Em Principal informe as contas AWS que devem possuir acesso ao repositorio
# Account ID 233801601735 (SHARED) deve estar em todos os repositorios
resource "aws_ecr_repository_policy" "rails-app-snapshot" {
  repository = aws_ecr_repository.rails-app-snapshot.name
  policy     = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
       {
           "Sid": "AllowPushPull",
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

# Remoção de imagens sem tag após 14 dias
# Essa regra atende 99% dos cenários, só mude se for realmente necessário.
resource "aws_ecr_lifecycle_policy" "rails-app-snapshot" {
  repository = aws_ecr_repository.rails-app-snapshot.name

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
#########
# Release
#########
resource "aws_ecr_repository" "rails-app" {
  name                 = "rails-app"
  image_tag_mutability = "IMMUTABLE" # RELEASE
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
            "Sid": "AllowPushPull",
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