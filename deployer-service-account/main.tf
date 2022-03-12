locals {
  deployer_default_roles = [
    "roles/logging.logWriter",
    "roles/viewer"
  ]
}

resource "google_service_account" "cicd_cloudrun_sa" {
  project      = var.project_id
  account_id   = var.name
  display_name = "Service Account for CICD actions related to cloud run"
}

# resource "google_cloud_run_service_iam_member" "member" {
#   project      = var.project_id
#   service = google_cloud_run_service.default.name
#   location = google_cloud_run_service.default.location

#   role = "roles/run.admin"
#   member = "serviceAccount:${google_service_account.cicd_cloudrun_sa.email}"
# }

resource "google_service_account_key" "cicd_cloudrun_sa_key" {
  service_account_id = google_service_account.cicd_cloudrun_sa.name
}

# This SA needs to be able to do some privileged work
#tfsec:ignore:google-iam-no-privileged-service-accounts
resource "google_project_iam_binding" "iam_binding_project" {
  for_each = setunion(toset(local.deployer_default_roles), var.additional_deployer_sa_roles)
  project  = var.project_id
  role     = each.value

  members = [
    "serviceAccount:${google_service_account.cicd_cloudrun_sa.email}"
  ]
}