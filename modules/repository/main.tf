variable "name" {
  type        = string
  description = "The name of the repository. Must be unique within the same organization"
}

variable "team_owner_name" {
  type = string
}

variable "is_archived" {
  type        = bool
  default     = false
  description = "Whether the repository is a read-only archive. Default: false"
}

variable "actions_secrets_global" {
  type = map(object({
    secret_name     = string
    encrypted_value = string
  }))
  default     = {}
  description = "A map of secret names to encrypted values. Default: empty"
}

variable "actions_variables_global" {
  type = map(object({
    variable_key   = string
    variable_value = string
  }))
  default     = {}
  description = "A map of environment variable keys to values. Default: empty"
}

resource "github_repository" "repository" {
  allow_auto_merge            = false
  allow_merge_commit          = false
  allow_rebase_merge          = false
  allow_squash_merge          = true
  squash_merge_commit_message = "BLANK"
  squash_merge_commit_title   = "PR_TITLE"
  allow_update_branch         = true
  archived                    = var.is_archived
  auto_init                   = true
  delete_branch_on_merge      = true
  has_discussions             = false
  has_downloads               = false
  has_issues                  = false
  has_projects                = false
  has_wiki                    = false
  is_template                 = false
  name                        = var.name
  topics                      = []
  visibility                  = "public"
  vulnerability_alerts        = false
  web_commit_signoff_required = false
}

resource "github_repository_collaborators" "repository_collaborators" {
  repository = github_repository.repository.name

  team {
    permission = "maintain"
    team_id    = var.team_owner_name
  }
}

resource "github_branch" "main" {
  branch     = "main"
  repository = github_repository.repository.name

  depends_on = [github_repository.repository]
}

resource "github_branch_default" "main" {
  branch     = github_branch.main.branch
  repository = github_repository.repository.name

  depends_on = [github_branch.main]
}

resource "github_branch_protection_v3" "main" {
  repository                      = github_repository.repository.name
  branch                          = github_branch.main.branch
  enforce_admins                  = true
  require_conversation_resolution = true

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 1

    bypass_pull_request_allowances {
      apps  = ["bakiorg-github"]
      users = ["bakilol"]
    }
  }

  depends_on = [github_branch.main]
}

resource "github_repository_file" "codeowners" {
  repository          = github_repository.repository.name
  branch              = github_branch.main.branch
  file                = ".github/CODEOWNERS"
  content             = "* @bakiorg/${var.team_owner_name}\n"
  commit_message      = "Managed by Terraform"
  overwrite_on_create = true
}

resource "github_issue_labels" "labels" {
  repository = github_repository.repository.name

  label {
    name  = "Urgent"
    color = "FF0000"
  }

  label {
    name  = "Critical"
    color = "FF0000"
  }
}

resource "github_actions_secret" "repository_secret" {
  for_each = var.actions_secrets_global

  repository      = github_repository.repository.name
  secret_name     = each.value.secret_name
  encrypted_value = each.value.encrypted_value
}

resource "github_actions_variable" "repository_variable" {
  for_each = var.actions_variables_global

  repository    = github_repository.repository.name
  variable_name = each.value.variable_key
  value         = each.value.variable_value
}


