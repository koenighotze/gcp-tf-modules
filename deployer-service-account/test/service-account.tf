module "service_repository_deployer_sa" {
  source = "../"

  name           = "test-${random_uuid.random_id.result}"
  project_id = var.project_id
}
