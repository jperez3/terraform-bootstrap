# terraform-bootstrap



* Example terraform apply output:

```hcl
Terraform will perform the following actions:

  # module.mario.aws_ecr_repository.service[0] will be created
  + resource "aws_ecr_repository" "service" {
      + arn                  = (known after apply)
      + id                   = (known after apply)
      + image_tag_mutability = "MUTABLE"
      + name                 = "mario"
      + registry_id          = (known after apply)
      + repository_url       = (known after apply)
      + tags_all             = (known after apply)

      + image_scanning_configuration {
          + scan_on_push = true
        }
    }

  # module.mario.datadog_monitor.service[0] will be created
  + resource "datadog_monitor" "service" {
      + escalation_message  = "Escalation message @pagerduty-mario"
      + evaluation_delay    = (known after apply)
      + id                  = (known after apply)
      + include_tags        = true
      + message             = "Monitor triggered. Notify: @operations-team"
      + name                = "basic monitor for mario"
      + new_host_delay      = 300
      + notify_audit        = false
      + notify_no_data      = false
      + query               = "avg(last_1h):avg:aws.ec2.cpu{environment:prod,host:foo} by {host} > 4"
      + renotify_interval   = 60
      + require_full_window = true
      + tags                = [
          + "env:prod",
          + "service:mario",
        ]
      + type                = "metric alert"

      + monitor_thresholds {
          + critical          = "4"
          + critical_recovery = "3"
          + warning           = "2"
          + warning_recovery  = "1"
        }
    }

  # module.mario.module.repo[0].github_repository.service will be created
  + resource "github_repository" "service" {
      + allow_auto_merge       = false
      + allow_merge_commit     = true
      + allow_rebase_merge     = true
      + allow_squash_merge     = true
      + archived               = false
      + branches               = (known after apply)
      + default_branch         = (known after apply)
      + delete_branch_on_merge = false
      + description            = "github repo for mario"
      + etag                   = (known after apply)
      + full_name              = (known after apply)
      + git_clone_url          = (known after apply)
      + html_url               = (known after apply)
      + http_clone_url         = (known after apply)
      + id                     = (known after apply)
      + name                   = "mario"
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

Plan: 3 to add, 0 to change, 0 to destroy.
```
