output "service_account_email" {
  value = google_service_account.cicd_cloudrun_sa.email
}

output "service_account_id" {
  value = google_service_account.cicd_cloudrun_sa.id
}