variable "env" {
  description = "short and unique environment name"
}

variable "service" {
  description = "unique service name which will be applied to the github and ECR repos"
}


locals {
  # Name for AWS resources (gha = github actions)
  name = "gha-${var.organization}-${var.service}-${var.env}"

  common_tags = {
    Environment = var.env
    Managed-By  = "terraform"
    Service     = var.service
    TF-Module   = "${var.organization}/terraform-bootstrap/service"
  }
}
