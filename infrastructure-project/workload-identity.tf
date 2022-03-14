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

# Allow repository to use deployer service account
resource "google_service_account_iam_binding" "workload_identity_sa_binding" {
  service_account_id = data.google_service_account.sa.id
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "principalSet://iam.googleapis.com/${var.workload_identity_pool_id}/attribute.repository/${github_repository.infrastructure_repository.full_name}",
  ]
}
