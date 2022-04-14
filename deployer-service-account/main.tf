locals {
  deployer_default_roles = [
    "roles/logging.logWriter",
    "roles/viewer",
    "roles/iam.serviceAccountTokenCreator"
  ]
}

resource "google_service_account" "sa" {
  project      = var.project_id
  account_id   = "${var.name}-cicd"
  display_name = var.name
  description  = "CI/CD service account for ${var.project_id}"
}

# This SA needs to be able to do some privileged work
#tfsec:ignore:google-iam-no-privileged-service-accounts
resource "google_project_iam_member" "iam_member_project" {
  for_each = setunion(toset(local.deployer_default_roles), var.additional_deployer_sa_roles)
  project  = var.project_id
  role     = each.value
  member   = "serviceAccount:${google_service_account.sa.email}"
}
