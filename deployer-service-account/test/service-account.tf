module "service_repository_deployer_sa" {
  source = "../"

  name           = "test-${random_uuid.random_id.result}"
  gcp_project_id = var.project_id
}
