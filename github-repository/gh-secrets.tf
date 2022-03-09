resource "github_actions_secret" "gcp_projectid_secret" {
  repository      = github_repository.repository.id
  secret_name     = "GCP_PROJECT_ID"
  plaintext_value = var.gcp_project_id
}

resource "github_actions_secret" "docker_registry_token" {
  repository      = github_repository.repository.id
  secret_name     = "DOCKER_REGISTRY_TOKEN"
  plaintext_value = var.docker_registry_token
}

resource "github_actions_secret" "docker_registry_username" {
  repository      = github_repository.repository.id
  secret_name     = "DOCKER_REGISTRY_USERNAME"
  plaintext_value = var.docker_registry_username
}

resource "github_actions_secret" "codacy_api_token" {
  repository      = github_repository.repository.id
  secret_name     = "CODACY_API_TOKEN"
  plaintext_value = var.codacy_api_token
}

resource "github_actions_secret" "github_api_token" {
  repository      = github_repository.infrastructure_repository.id
  secret_name     = "ADMIN_GITHUB_TOKEN"
  plaintext_value = var.github_admin_token
}

resource "github_actions_secret" "github_api_label_token" {
  repository      = github_repository.infrastructure_repository.id
  secret_name     = "GH_TOKEN_FOR_LABELING"
  plaintext_value = var.github_non_admin_token
}

resource "github_actions_secret" "sa_email_address" {
  repository      = github_repository.infrastructure_repository.id
  secret_name     = "CICD_SA_EMAIL_ADDRESS" # todo replace with label token
  plaintext_value = data.google_service_account.deployer_sa.email
}

resource "github_actions_secret" "sa_id" {
  repository      = github_repository.infrastructure_repository.id
  secret_name     = "CICD_SA_ID" # todo replace with label token
  plaintext_value = var.service_account_id
}

resource "github_actions_secret" "workload_identity_provider" {
  repository      = github_repository.infrastructure_repository.id
  secret_name     = "WORKLOAD_IDENTITY_PROVIDER"
  plaintext_value = var.workload_identity_provider_name
}

resource "github_actions_secret" "workload_identity_pool_id" {
  repository      = github_repository.infrastructure_repository.id
  secret_name     = "WORKLOAD_IDENTITY_POOL_ID"
  plaintext_value = var.workload_identity_pool_id
}