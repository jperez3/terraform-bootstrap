###############
# Github Repo #
###############

resource "github_repository" "service" {
  name        = var.service
  description = "github repo for ${var.service} service"

  visibility = var.repo_visibility

  template {
    owner      = var.organization
    repository = var.template_repository
  }
}


resource "github_actions_secret" "aws_region" {
  repository       = github_repository.service.name
  secret_name      = "AWS_REGION"
  plaintext_value  = data.aws_region.current.name
}

resource "github_actions_secret" "aws_role_arn" {
  repository       = github_repository.service.name
  secret_name      = "AWS_ROLE_ARN"
  plaintext_value  = aws_iam_role.github_actions.arn
}

resource "github_actions_secret" "ecr_repo_url" {
  repository       = github_repository.service.name
  secret_name      = "ECR_REPO_URL"
  plaintext_value  = aws_ecr_repository.service.repository_url
}


##################
# Github Outputs #
##################

output "ssh_clone_url" {
  description = "clone url to start working witih repo"
  value       = github_repository.service.ssh_clone_url
}
