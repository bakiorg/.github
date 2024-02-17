module "owners" {
  source    = "./modules/team"
  team_name = "owners"
  member_usernames = [
    "bakilol"
  ]
}