locals {
  bakiorg_github_app_name             = "bakiorg-github"
  bakiorg_github_app_installation_id  = "47400743"
  bakiorg_github_app_private_key_path = "./secrets/repositories/.github/actions/bakiorg-github.2024-02-16.private-key.pem.encrypted"
}

data "github_app" "bakiorg_github" {
  slug = local.bakiorg_github_app_name
}