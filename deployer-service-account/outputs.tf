output "service_account_name" {
  value = google_service_account.cicd_cloudrun_sa.name
}

output "service_account_private_key" {
  value = google_service_account_key.cicd_cloudrun_sa_key
}