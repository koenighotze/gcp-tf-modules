#tfsec:ignore:google-storage-bucket-encryption-customer-key
resource "google_storage_bucket" "state_bucket" {
  #checkov:skip=CKV_GCP_62:Logging deactivated for now
  project                     = var.project_id
  name                        = "${var.project_id}-state"
  location                    = var.location
  uniform_bucket_level_access = true
  force_destroy               = true

  public_access_prevention = "enforced"

  versioning {
    enabled = true
  }
}

resource "google_storage_bucket_iam_member" "bucket_iam_member" {
  bucket = google_storage_bucket.state_bucket.name
  role   = "roles/storage.admin"
  member = "serviceAccount:${var.service_account_email}"
}
