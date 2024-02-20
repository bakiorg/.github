resource "github_actions_organization_variable" "bakiorg_github_app_name" {
  variable_name = "BAKIORG_GITHUB_WORKFLOW_UPDATER_APP_NAME"
  value         = local.bakiorg_github_workflow_updater_app_name
  visibility    = "all"
}

resource "github_actions_organization_variable" "bakiorg_github_app_bot_name" {
  variable_name = "BAKIORG_GITHUB_WORKFLOW_UPDATER_APP_BOT_NAME"
  value         = local.bakiorg_github_workflow_updater_app_bot_name
  visibility    = "all"
}

resource "github_actions_organization_variable" "bakiorg_github_workflow_updater_app_id" {
  variable_name = "BAKIORG_GITHUB_WORKFLOW_UPDATER_APP_ID"
  value         = local.bakiorg_github_workflow_updater_app_id
  visibility    = "all"
}

resource "github_actions_organization_variable" "bakiorg_github_workflow_updater_app_bot_id" {
  variable_name = "BAKIORG_GITHUB_WORKFLOW_UPDATER_APP_BOT_ID"
  value         = local.bakiorg_github_workflow_updater_app_bot_id
  visibility    = "all"
}

resource "github_actions_organization_variable" "bakiorg_github_workflow_updater_app_installation_id" {
  variable_name = "BAKIORG_GITHUB_WORKFLOW_UPDATER_APP_INSTALLATION_ID"
  value         = local.bakiorg_github_workflow_updater_app_installation_id
  visibility    = "all"
}
