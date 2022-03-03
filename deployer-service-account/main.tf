resource "google_service_account" "cicd_cloudrun_sa" {
  project      = var.gcp_project_id
  account_id   = var.name
  display_name = "Service Account for CICD actions related to cloud run"
}

# resource "google_cloud_run_service_iam_member" "member" {
#   project      = var.gcp_project_id
#   service = google_cloud_run_service.default.name
#   location = google_cloud_run_service.default.location

#   role = "roles/run.admin"
#   member = "serviceAccount:${google_service_account.cicd_cloudrun_sa.email}"
# }

resource "google_service_account_key" "cicd_cloudrun_sa_key" {
  service_account_id = google_service_account.cicd_cloudrun_sa.name
}
