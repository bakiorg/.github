terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.0.0"
    }
  }
}

provider "github" {
  owner = "bakiorg"
  app_auth {
    id              = "830820"
    installation_id = "47400743"
    pem_file        = file("/home/baki/.github/bakiorg-github.2024-02-16.private-key.pem")
  }
}

