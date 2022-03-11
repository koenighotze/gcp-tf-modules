# Allow repository to use deployer service account
resource "google_service_account_iam_binding" "workload_identity_sa_binding" {
  service_account_id = var.service_account_id
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "principalSet://iam.googleapis.com/${var.workload_identity_pool_id}/attribute.repository/${github_repository.repository.name}",
  ]
}