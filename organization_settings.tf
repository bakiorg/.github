resource "github_organization_settings" "organization_settings" {
  advanced_security_enabled_for_new_repositories               = false
  billing_email                                                = "bazestamatovski@gmail.com"
  blog                                                         = ""
  company                                                      = ""
  default_repository_permission                                = "write"
  dependabot_alerts_enabled_for_new_repositories               = false
  dependabot_security_updates_enabled_for_new_repositories     = false
  dependency_graph_enabled_for_new_repositories                = false
  description                                                  = ""
  email                                                        = ""
  has_organization_projects                                    = false
  has_repository_projects                                      = false
  location                                                     = ""
  members_can_create_internal_repositories                     = false
  members_can_create_pages                                     = false
  members_can_create_private_pages                             = false
  members_can_create_private_repositories                      = false
  members_can_create_public_pages                              = false
  members_can_create_public_repositories                       = false
  members_can_create_repositories                              = false
  members_can_fork_private_repositories                        = false
  name                                                         = "bakiorg"
  secret_scanning_enabled_for_new_repositories                 = false
  secret_scanning_push_protection_enabled_for_new_repositories = false
  twitter_username                                             = ""
  web_commit_signoff_required                                  = false
}

