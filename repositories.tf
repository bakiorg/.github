module "github" {
  source          = "./modules/repository"
  name            = ".github"
  team_owner_name = module.owners.team_name
  actions_secrets_global = {
    bakiorg_github_app_private_key = {
      secret_name     = "BAKIORG_GITHUB_APP_PRIVATE_KEY"
      encrypted_value = file(local.bakiorg_github_app_private_key_path)
    }

    bakiorg_terraform_tfstate_gpg_key = {
      secret_name     = "BAKIORG_TERRAFORM_TFSTATE_GPG_KEY"
      encrypted_value = file("./secrets/repositories/.github/actions/terraform.tfstate.gpg.key.encrypted")
    }
  }
  actions_variables_global = {
    bakiorg_github_app_name = {
      variable_key   = "BAKIORG_GITHUB_APP_NAME"
      variable_value = local.bakiorg_github_app_name
    }

    bakiorg_github_app_bot_name = {
      variable_key   = "BAKIORG_GITHUB_APP_BOT_NAME"
      variable_value = local.bakiorg_github_app_bot_name
    }

    bakiorg_github_app_id = {
      variable_key   = "BAKIORG_GITHUB_APP_ID"
      variable_value = data.github_app.bakiorg_github.id
    }

    bakiorg_github_app_bot_id = {
      variable_key   = "BAKIORG_GITHUB_APP_BOT_ID"
      variable_value = local.bakiorg_github_app_bot_id
    }

    bakiorg_github_app_installation_id = {
      variable_key   = "BAKIORG_GITHUB_APP_INSTALLATION_ID"
      variable_value = local.bakiorg_github_app_installation_id
    }
  }

  required_status_checks = [
    "GitHub Actions supply chain security / Pin GitHub Actions versions",
    "Terraform / Plan"
  ]
}
