# Containerized Service Bootsrap

### General

* Description: A module to bootstrap the creation of a new containerized service by creating the github repo, an ECR repo, and the necessary IAM resources to allow Github Actions to Upload images to ECR
* Created By: `jperez3`
* Module Dependencies:
  * Github OIDC must be configured in AWS account

* Provider Dependencies:
  * `aws`
  * `github`
* Terraform Version: `1.x`


### Usage

* Terraform (basic example):

```hcl
module "burrito" {
  source = "git::git@github.com:jperez3/terraform-bootstrap.git//service?ref=service-v1.0.0"

  env     = "prod"
  service = "burrito"

}

```

* Terraform (alternate example):

```hcl
module "burrito" {
  source = "git::git@github.com:jperez3/terraform-bootstrap.git//service?ref=service-v1.0.0"

  env     = "prod"
  service = "burrito"

  # Alternate github repo to use as template
  organization  = "tacosporfavor"
  repo_template = "tamales"

}

```

### Options

* Description: Input variable options and Outputs for other modules to consume

#### Inputs

| Variable Name | Description                                   | Options                           |  Type  | Required? | Notes |
| :------------ | :-------------------------------------------- | :-------------------------------- | :----: | :-------: | :---- |
| env           | unique environment name                       | test/staging/prod                 | string |    Yes    | N/A   |
| service       | unique service name                           |                                   | string |    Yes    | N/A   |
| organization  | github organization name (or github username) | (default: `jperez3`)              | string |    No     | N/A   |
| repo_template | github repo to use as a template              | (default: `repo-template-docker`) | string |    No     | N/A   |


#### Outputs

| Variable Name | Description                 |  Type  | Notes |
| :------------ | :-------------------------- | :----: | :---- |
| ssh_clone_url | github repo ssh clone url   | string | N/A   |
| gha_url       | github actions url for repo | string | N/A   |

### Lessons Learned

* Getting the permissions right can be tricky, especially if you don't want to give github actions blanket access to the ECR repo
* Passing the region/role/ecr-url to github secrets prevents some "fat-fingering" and templatizes the github action workflow


### References

* [Using Github Actions OpenID Connect to push to AWS ECR without Credentials](https://blog.tedivm.com/guides/2021/10/github-actions-push-to-aws-ecr-without-credentials-oidc/)
* [Security harden Github Action deployments to AWS with OIDC](https://www.jerrychang.ca/writing/security-harden-github-actions-deployments-to-aws-with-oidc)
* [Configuring OpenID Connect in Amazon Web Services](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services)
* [Obtaining the thumbprint for an OpenID Connect Identity Provider](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_oidc_verify-thumbprint.html)
