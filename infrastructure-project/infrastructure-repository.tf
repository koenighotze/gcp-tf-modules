locals {
  repository_name = "${var.project_name}-infrastructure-${var.project_id}"
}

resource "github_repository" "infrastructure_repository" {
  name        = local.repository_name
  description = "Infrastructure for ${var.project_name}"

  #checkov:skip=CKV_GIT_1:Public repos are fine
  #tfsec:ignore:github-repositories-private
  visibility             = "public"
  archive_on_destroy     = true
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
    "ADMIN_GITHUB_TOKEN"         = var.github_admin_token
    "CICD_SA_EMAIL_ADDRESS"      = var.service_account_email
    "CODACY_API_TOKEN"           = var.codacy_api_token
    "DOCKER_REGISTRY_TOKEN"      = var.docker_registry_token
    "DOCKER_REGISTRY_USERNAME"   = var.docker_registry_username
    "GCP_PROJECT_ID"             = var.project_id
    "GH_TOKEN_FOR_LABELING"      = var.github_api_label_token
    "TERRAFORM_STATE_BUCKET"     = google_storage_bucket.state_bucket.name
    "CONTAINER_REGISTRY"         = var.container_registry
    "WORKLOAD_IDENTITY_PROVIDER" = var.workload_identity_provider_name
    "WORKLOAD_IDENTITY_POOL_ID"  = var.workload_identity_pool_id
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
