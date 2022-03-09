output "google_service_account_email" {
  value = google_service_account.service_account.email
}

output "google_service_account_id" {
  value = google_service_account.service_account.id
}

output "github_repository_full_name" {
  value = github_repository.infrastructure_repository.full_name
}

output "github_repository_id" {
  value = github_repository.infrastructure_repository.id
}