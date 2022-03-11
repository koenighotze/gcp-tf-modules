locals {
  repository_name = "${var.project_name}-infrastructure-tmp"
}

resource "github_repository" "infrastructure_repository" {
  name        = local.repository_name
  description = "Infrastructure for ${var.project_name}"

  #checkov:skip=CKV_GIT_1:Public repos are fine
  #tfsec:ignore:github-repositories-private
  visibility             = "public"
  has_issues             = true
  has_projects           = false
  has_wiki               = false
  allow_auto_merge       = true
  delete_branch_on_merge = true
  auto_init              = true
  topics                 = ["terraform", "gcp"]
  vulnerability_alerts   = true
}

resource "github_actions_secret" "gcp_projectid_secret" {
  for_each = {
    "ADMIN_GITHUB_TOKEN"       = var.github_admin_token
    "CICD_SA_EMAIL_ADDRESS"    = google_service_account.service_account.email
    "CICD_SA_ID"               = google_service_account.service_account.id
    "CODACY_API_TOKEN"         = var.codacy_api_token
    "DOCKER_REGISTRY_TOKEN"    = var.docker_registry_token
    "DOCKER_REGISTRY_USERNAME" = var.docker_registry_username
    "GCP_PROJECT_ID"           = var.project_id
    "GH_TOKEN_FOR_LABELING"    = var.github_api_label_token
    "TERRAFORM_STATE_BUCKET"   = google_storage_bucket.state_bucket.name
  }

  repository      = github_repository.infrastructure_repository.id
  secret_name     = each.key
  plaintext_value = each.value
}

resource "github_branch_protection" "main" {
  repository_id = github_repository.infrastructure_repository.id

  pattern                         = "main"
  enforce_admins                  = false
  allows_deletions                = false
  require_conversation_resolution = true
  allows_force_pushes             = false
}
