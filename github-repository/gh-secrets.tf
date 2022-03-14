resource "github_actions_secret" "gcp_projectid_secret" {
  for_each = {
    "ADMIN_GITHUB_TOKEN"         = var.github_admin_token
    "CICD_SA_EMAIL_ADDRESS"      = var.deployer_service_account_email
    "CICD_SA_ID"                 = data.google_service_account.deployer_sa.id
    "CODACY_API_TOKEN"           = var.codacy_api_token
    "DOCKER_REGISTRY_TOKEN"      = var.docker_registry_token
    "DOCKER_REGISTRY_USERNAME"   = var.docker_registry_username
    "GCP_PROJECT_ID"             = var.project_id
    "GH_TOKEN_FOR_LABELING"      = var.github_non_admin_token
    "TERRAFORM_STATE_BUCKET"     = var.terraform_state_bucket
    "WORKLOAD_IDENTITY_POOL_ID"  = var.workload_identity_pool_id
    "WORKLOAD_IDENTITY_PROVIDER" = var.workload_identity_provider_name
    "CONTAINER_REGISTRY"         = var.container_registry
  }

  repository      = github_repository.repository.id
  secret_name     = each.key
  plaintext_value = each.value
}
