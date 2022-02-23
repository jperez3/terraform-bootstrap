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

resource "github_actions_secret" "aws_account_id" {
  repository       = github_repository.service.name
  secret_name      = "AWS_ACCOUNT_ID"
  plaintext_value  = data.aws_caller_identity.current.account_id
}

resource "github_actions_secret" "aws_region" {
  repository       = github_repository.service.name
  secret_name      = "AWS_REGION"
  plaintext_value  = data.aws_region.current.name
}

resource "github_actions_secret" "service" {
  repository       = github_repository.service.name
  secret_name      = "SERVICE"
  plaintext_value  = var.service
}


##################
# Github Outputs #
##################

output "ssh_clone_url" {
  description = "clone url to start working witih repo"
  value       = github_repository.service.ssh_clone_url
}
