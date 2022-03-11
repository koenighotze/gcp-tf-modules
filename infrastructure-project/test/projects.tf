module "test_project" {
  source = "../"

  project_id                      = "test-${random_uuid.id.result}"
  project_name                    = "test-${random_uuid.id.result}"
  github_admin_token              = random_uuid.id.result
  github_api_label_token          = random_uuid.id.result
  workload_identity_provider_name = random_uuid.id.result
  workload_identity_pool_id       = random_uuid.id.result
}
