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

#########################
# Github Action Secrets #
#########################

# Creating secrets for the information needed by github actions workflow(s) to upload to the service's ECR repo
resource "github_actions_secret" "aws_region" {
  repository      = github_repository.service.name
  secret_name     = "AWS_REGION"
  plaintext_value = data.aws_region.current.name
}

resource "github_actions_secret" "gha_default_role_arn" {
  repository      = github_repository.service.name
  secret_name     = "GHA_DEFAULT_ROLE_ARN"
  plaintext_value = aws_iam_role.gha_default.arn
}

resource "github_actions_secret" "ecr_repo_url" {
  repository      = github_repository.service.name
  secret_name     = "ECR_REPO_URL"
  plaintext_value = aws_ecr_repository.service.repository_url
}


##################
# Github Outputs #
##################

output "ssh_clone_url" {
  description = "clone url to start working witih repo"
  value       = github_repository.service.ssh_clone_url
}

output "gha_url" {
  description = "link to repo's github action tab"
  value       = "${github_repository.service.html_url}/actions"
}
