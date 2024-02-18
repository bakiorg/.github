variable "team_name" {
  type        = string
  description = "The name of the team. Must be unique within the same organization"
}

variable "member_usernames" {
  type        = set(string)
  description = "The set of usernames that are members of this team."
  default     = []
}

resource "github_team" "team" {
  name    = var.team_name
  privacy = "closed"
}

resource "github_team_membership" "some_team_membership" {
  team_id = github_team.team.id

  for_each = var.member_usernames
  username = each.value
  role     = "maintainer"
}

resource "github_team_settings" "code_review_settings" {
  team_id = github_team.team.id
  review_request_delegation {
    algorithm    = "LOAD_BALANCE"
    member_count = 1
    notify       = true
  }
}

output "team_name" {
  value = github_team.team.name
}

output "team_id" {
  value = github_team.team.id
}