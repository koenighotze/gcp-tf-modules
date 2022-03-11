module "service_repository" {
  source = "../"

  target_repository_name          = "service-${random_uuid.id.result}"
  codacy_api_token                = random_uuid.id.result
  docker_registry_username        = random_uuid.id.result
  docker_registry_token           = random_uuid.id.result
  project_id                      = var.project_id
  workload_identity_provider_name = random_uuid.id.result
  workload_identity_pool_id       = random_uuid.id.result
  deployer_service_account_email  = var.sa_email
  github_admin_token              = random_uuid.id.result
  github_non_admin_token          = random_uuid.id.result
  terraform_state_bucket          = random_uuid.id.result
}