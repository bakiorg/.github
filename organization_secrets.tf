resource "github_actions_organization_secret" "bakiorg_github_workflow_updater_app_private_key" {
  secret_name     = "BAKIORG_GITHUB_WORKFLOW_UPDATER_APP_PRIVATE_KEY"
  encrypted_value = file(local.bakiorg_github_workflow_updater_app_private_key_path)
  visibility      = "all"
}
