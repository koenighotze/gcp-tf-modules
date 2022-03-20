output "github_repository_full_name" {
  value = github_repository.infrastructure_repository.full_name
}

output "github_repository_id" {
  value = github_repository.infrastructure_repository.id
}

output "state_bucket_url" {
  value = google_storage_bucket.state_bucket.url
}