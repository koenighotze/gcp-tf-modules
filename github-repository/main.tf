resource "github_repository" "repository" {
  name        = var.target_repository_name
  description = "Repository for ${var.target_repository_name} in project ${var.gcp_project_id}"

  #checkov:skip=CKV_GIT_1:Public repos are fine
  #tfsec:ignore:github-repositories-private
  visibility             = "public"
  has_issues             = true
  has_projects           = false
  has_wiki               = false
  allow_auto_merge       = true
  delete_branch_on_merge = true
  auto_init              = true
  topics                 = ["gcp"]
  vulnerability_alerts   = true
}

resource "github_branch_protection" "main" {
  repository_id = github_repository.repository.id

  pattern                         = "main"
  enforce_admins                  = false
  allows_deletions                = false
  require_conversation_resolution = true
  allows_force_pushes             = false
}

resource "github_actions_secret" "cicd_cloudrun_sa_secret" {
  repository      = github_repository.repository.id
  secret_name     = "GCP_SA_KEY"
  plaintext_value = var.gcp_sa_private_key
}

resource "github_actions_secret" "gcp_projectid_secret" {
  repository      = github_repository.repository.id
  secret_name     = "GCP_PROJECT_ID"
  plaintext_value = var.gcp_project_id
}

# resource "github_actions_secret" "docker_registry_token" {
#   repository      = data.github_repository.target.id
#   secret_name     = "DOCKER_REGISTRY_TOKEN"
#   plaintext_value = var.docker_registry_token
# }

# resource "github_actions_secret" "docker_registry_username" {
#   repository      = data.github_repository.target.id
#   secret_name     = "DOCKER_REGISTRY_USERNAME"
#   plaintext_value = var.docker_registry_username
# }

# resource "github_actions_secret" "codacy_api_token" {
#   repository      = data.github_repository.target.id
#   secret_name     = "CODACY_API_TOKEN"
#   plaintext_value = var.codacy_api_token
# }
