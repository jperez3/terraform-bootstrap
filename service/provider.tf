terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.2.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 4.20.0"
    }
  }
}
