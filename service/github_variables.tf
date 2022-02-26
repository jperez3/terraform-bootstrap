variable "organization" {
  description = "Name of the Github Organization."
  default     = "jperez3"
}

variable "repo_visibility" {
  description = "sets repo to public or private"
  default     = "public"
}

variable "template_repository" {
  description = "github repo name to use as template"
  default     = "repo-template-docker"
}

variable "repo_default_branch_name" {
  description = "sets the default branch name"
  default     = "main"
}
