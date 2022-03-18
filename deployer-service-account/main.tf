locals {
  deployer_default_roles = [
    "roles/logging.logWriter",
    "roles/viewer"
  ]
}

resource "google_service_account" "cicd_cloudrun_sa" {
  project      = var.project_id
  account_id   = "${var.name}-cicd"
  display_name = var.name
  description  = "CI/CD service account for ${var.project_id}"
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
