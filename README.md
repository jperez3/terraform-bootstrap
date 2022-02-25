# terraform-bootstrap

* Example terraform apply output:

```hcl
Terraform will perform the following actions:

  # module.burrito.data.aws_iam_policy_document.ecr_allow_push will be read during apply
  # (config refers to values not yet known)
 <= data "aws_iam_policy_document" "ecr_allow_push"  {
      + id   = (known after apply)
      + json = (known after apply)

      + statement {
          + actions   = [
              + "ecr:BatchCheckLayerAvailability",
              + "ecr:BatchGetImage",
              + "ecr:CompleteLayerUpload",
              + "ecr:GetDownloadUrlForLayer",
              + "ecr:InitiateLayerUpload",
              + "ecr:PutImage",
              + "ecr:UploadLayerPart",
            ]
          + resources = [
              + (known after apply),
            ]
        }
      + statement {
          + actions   = [
              + "ecr:GetAuthorizationToken",
            ]
          + resources = [
              + "*",
            ]
        }
    }

  # module.burrito.data.aws_iam_policy_document.gha_assume_role_default will be read during apply
  # (config refers to values not yet known)
 <= data "aws_iam_policy_document" "gha_assume_role_default"  {
      + id   = (known after apply)
      + json = (known after apply)

      + statement {
          + actions = [
              + "sts:AssumeRoleWithWebIdentity",
            ]

          + condition {
              + test     = "StringEquals"
              + values   = [
                  + "sts.amazonaws.com",
                ]
              + variable = "token.actions.githubusercontent.com:aud"
            }
          + condition {
              + test     = "StringEquals"
              + values   = [
                  + (known after apply),
                ]
              + variable = "token.actions.githubusercontent.com:sub"
            }

          + principals {
              + identifiers = [
                  + "arn:aws:iam::1234567890:oidc-provider/token.actions.githubusercontent.com",
                ]
              + type        = "Federated"
            }
        }
    }

  # module.burrito.aws_ecr_repository.service will be created
  + resource "aws_ecr_repository" "service" {
      + arn                  = (known after apply)
      + id                   = (known after apply)
      + image_tag_mutability = "MUTABLE"
      + name                 = "burrito"
      + registry_id          = (known after apply)
      + repository_url       = (known after apply)
      + tags                 = {
          + "Environment" = "prod"
          + "Managed-By"  = "terraform"
          + "Name"        = "burrito"
          + "Service"     = "burrito"
          + "TF-Module"   = "jperez3/terraform-bootstrap/service"
        }
      + tags_all             = {
          + "Environment" = "prod"
          + "Managed-By"  = "terraform"
          + "Name"        = "burrito"
          + "Service"     = "burrito"
          + "TF-Module"   = "jperez3/terraform-bootstrap/service"
        }

      + image_scanning_configuration {
          + scan_on_push = true
        }
    }

  # module.burrito.aws_iam_policy.ecr_allow_push will be created
  + resource "aws_iam_policy" "ecr_allow_push" {
      + arn         = (known after apply)
      + description = (known after apply)
      + id          = (known after apply)
      + name        = "github-actions-burrito-ecr-allow-push"
      + path        = "/"
      + policy      = (known after apply)
      + policy_id   = (known after apply)
      + tags        = {
          + "Environment" = "prod"
          + "Managed-By"  = "terraform"
          + "Name"        = "github-actions-burrito-ecr-allow-push"
          + "Service"     = "burrito"
          + "TF-Module"   = "jperez3/terraform-bootstrap/service"
        }
      + tags_all    = {
          + "Environment" = "prod"
          + "Managed-By"  = "terraform"
          + "Name"        = "github-actions-burrito-ecr-allow-push"
          + "Service"     = "burrito"
          + "TF-Module"   = "jperez3/terraform-bootstrap/service"
        }
    }

  # module.burrito.aws_iam_role.gha_default will be created
  + resource "aws_iam_role" "gha_default" {
      + arn                   = (known after apply)
      + assume_role_policy    = (known after apply)
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "github-actions-jperez3-burrito-main"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags                  = {
          + "Environment" = "prod"
          + "Managed-By"  = "terraform"
          + "Name"        = "github-actions-jperez3-burrito-main"
          + "Service"     = "burrito"
          + "TF-Module"   = "jperez3/terraform-bootstrap/service"
        }
      + tags_all              = {
          + "Environment" = "prod"
          + "Managed-By"  = "terraform"
          + "Name"        = "github-actions-jperez3-burrito-main"
          + "Service"     = "burrito"
          + "TF-Module"   = "jperez3/terraform-bootstrap/service"
        }
      + unique_id             = (known after apply)

      + inline_policy {
          + name   = (known after apply)
          + policy = (known after apply)
        }
    }

  # module.burrito.aws_iam_role_policy_attachment.gha_default will be created
  + resource "aws_iam_role_policy_attachment" "gha_default" {
      + id         = (known after apply)
      + policy_arn = (known after apply)
      + role       = "github-actions-jperez3-burrito-main"
    }

  # module.burrito.github_actions_secret.aws_region will be created
  + resource "github_actions_secret" "aws_region" {
      + created_at      = (known after apply)
      + id              = (known after apply)
      + plaintext_value = (sensitive value)
      + repository      = "burrito"
      + secret_name     = "AWS_REGION"
      + updated_at      = (known after apply)
    }

  # module.burrito.github_actions_secret.ecr_repo_url will be created
  + resource "github_actions_secret" "ecr_repo_url" {
      + created_at      = (known after apply)
      + id              = (known after apply)
      + plaintext_value = (sensitive value)
      + repository      = "burrito"
      + secret_name     = "ECR_REPO_URL"
      + updated_at      = (known after apply)
    }

  # module.burrito.github_actions_secret.gha_default_role_arn will be created
  + resource "github_actions_secret" "gha_default_role_arn" {
      + created_at      = (known after apply)
      + id              = (known after apply)
      + plaintext_value = (sensitive value)
      + repository      = "burrito"
      + secret_name     = "GHA_DEFAULT_ROLE_ARN"
      + updated_at      = (known after apply)
    }

  # module.burrito.github_repository.service will be created
  + resource "github_repository" "service" {
      + allow_auto_merge       = false
      + allow_merge_commit     = true
      + allow_rebase_merge     = true
      + allow_squash_merge     = true
      + archived               = false
      + branches               = (known after apply)
      + default_branch         = (known after apply)
      + delete_branch_on_merge = false
      + description            = "github repo for burrito service"
      + etag                   = (known after apply)
      + full_name              = (known after apply)
      + git_clone_url          = (known after apply)
      + html_url               = (known after apply)
      + http_clone_url         = (known after apply)
      + id                     = (known after apply)
      + name                   = "burrito"
      + node_id                = (known after apply)
      + private                = (known after apply)
      + repo_id                = (known after apply)
      + ssh_clone_url          = (known after apply)
      + svn_url                = (known after apply)
      + visibility             = "public"

      + template {
          + owner      = "jperez3"
          + repository = "repo-template-docker"
        }
    }

Plan: 8 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + gha_url       = (known after apply)
  + ssh_clone_url = (known after apply)
```
