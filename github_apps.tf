locals {
  bakiorg_github_app_name             = "bakiorg-github"
  bakiorg_github_app_bot_name         = "bakiorg-github[bot]"
  bakiorg_github_app_bot_id           = "160287034" # https://api.github.com/users/bakiorg-github[bot] -> .id
  bakiorg_github_app_installation_id  = "47400743"
  bakiorg_github_app_private_key_path = "./secrets/repositories/.github/actions/bakiorg-github.2024-02-16.private-key.pem.encrypted"

  bakiorg_github_workflow_updater_app_name             = "bakiorg-github-workflow-updater"
  bakiorg_github_workflow_updater_app_id               = "831390"
  bakiorg_github_workflow_updater_app_bot_name         = "bakiorg-github-workflow-updater[bot]"
  bakiorg_github_workflow_updater_app_bot_id           = "160338808" # https://api.github.com/users/bakiorg-github-workflow-updater[bot] -> .id
  bakiorg_github_workflow_updater_app_installation_id  = "47422442"
  bakiorg_github_workflow_updater_app_private_key_path = "./secrets/organization/actions/bakiorg-github-workflow-updater.2024-02-17.private-key.pem.encrypted"
}

data "github_app" "bakiorg_github" {
  slug = local.bakiorg_github_app_name
}