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

# No more keys...we'll use workload identity instead
# resource "github_actions_secret" "cicd_cloudrun_sa_secret" {
#   repository      = github_repository.infrastructure_repository.id
#   secret_name     = "GCP_SA_KEY"
#   plaintext_value = google_service_account_key.key.private_key
# }

resource "github_actions_secret" "gcp_projectid_secret" {
  repository      = github_repository.infrastructure_repository.id
  secret_name     = "GCP_PROJECT_ID"
  plaintext_value = var.project_id
}

resource "github_actions_secret" "terraform_bucket_name" {
  repository      = github_repository.infrastructure_repository.id
  secret_name     = "TERRAFORM_STATE_BUCKET"
  plaintext_value = google_storage_bucket.state_bucket.name
}

resource "github_actions_secret" "github_api_token" {
  repository      = github_repository.infrastructure_repository.id
  secret_name     = "ADMIN_GITHUB_TOKEN"
  plaintext_value = var.github_admin_token
}

resource "github_branch_protection" "main" {
  repository_id = github_repository.infrastructure_repository.id

  pattern                         = "main"
  enforce_admins                  = false
  allows_deletions                = false
  require_conversation_resolution = true
  allows_force_pushes             = false
}

# resource "github_actions_secret" "docker_registry_token" {
#   repository      = github_repository.infrastructure_repository.id
#   secret_name     = "DOCKER_REGISTRY_TOKEN"
#   plaintext_value = var.docker_registry_token
# }

# resource "github_actions_secret" "docker_registry_username" {
#   repository      = github_repository.infrastructure_repository.id
#   secret_name     = "DOCKER_REGISTRY_USERNAME"
#   plaintext_value = var.docker_registry_username
# }

# resource "github_actions_secret" "codacy_api_token" {
#   repository      = github_repository.infrastructure_repository.id
#   secret_name     = "CODACY_API_TOKEN"
#   plaintext_value = var.codacy_api_token
# }

resource "github_actions_secret" "workload_identity_provider" {
  repository      = github_repository.infrastructure_repository.id
  secret_name     = "WORKLOAD_IDENTITY_PROVIDER"
  plaintext_value = var.workload_identity_provider_name
}

# Allow repository to use deployer service account
resource "google_service_account_iam_binding" "workload_identity_sa_binding" {
  service_account_id = google_service_account.service_account.id
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "principalSet://iam.googleapis.com/${var.workload_identity_pool_id}/attribute.repository/${github_repository.infrastructure_repository.name}",
  ]
}