##############################
# Github Action Default Role #
##############################

# Github Action assumed role with Github OpenID Connect details
data "aws_iam_policy_document" "gha_assume_role_default" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com"]
    }
    # This only allows builds on the default branch, another role will needed to be created for pushing to other branches
    # and releases
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:${github_repository.service.full_name}:ref:refs/heads/${var.repo_default_branch_name}"]
    }
    # If you are using the official github action for docker build push, you need the condition below
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "gha_default" {
  name               = "github-actions-${var.organization}-${var.service}-${var.repo_default_branch_name}"
  assume_role_policy = data.aws_iam_policy_document.gha_assume_role_default.json

  tags = merge(
    local.common_tags,
    tomap({
      "Name" = "github-actions-${var.organization}-${var.service}-${var.repo_default_branch_name}"
    })
  )
}

############################
# Github Action IAM Policy #
############################

# Allows policy user to upload container images to this service's ECR repo
data "aws_iam_policy_document" "ecr_allow_push" {
  statement {
    actions = [
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:CompleteLayerUpload",
      "ecr:GetDownloadUrlForLayer",
      "ecr:InitiateLayerUpload",
      "ecr:PutImage",
      "ecr:UploadLayerPart",
    ]
    resources = [aws_ecr_repository.service.arn]
  }

  statement {
    actions = [
      "ecr:GetAuthorizationToken",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "ecr_allow_push" {
  name        = "github-actions-${var.service}-ecr-allow-push"
  description = "Grant Github Actions the ability to push to ${var.service} ECR repo from ${github_repository.service.full_name} github repo"
  policy      = data.aws_iam_policy_document.ecr_allow_push.json

  tags = merge(
    local.common_tags,
    tomap({
      "Name" = "github-actions-${var.service}-ecr-allow-push"
    })
  )
}

resource "aws_iam_role_policy_attachment" "gha_default" {
  role       = aws_iam_role.gha_default.name
  policy_arn = aws_iam_policy.ecr_allow_push.arn
}
