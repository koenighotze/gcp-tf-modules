# Allow repository to use deployer service account
resource "google_service_account_iam_member" "gce-default-workload_identity_sa_member" {
  service_account_id = data.google_service_account.sa.id
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${var.workload_identity_pool_id}/attribute.repository/${github_repository.infrastructure_repository.full_name}"
}
