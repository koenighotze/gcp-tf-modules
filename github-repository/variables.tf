variable "codacy_api_token" {
  type        = string
  sensitive   = true
  description = "The API token for uploading coverage data"
}

variable "docker_registry_username" {
  type        = string
  sensitive   = true
  description = "The username for uploading images"
}

variable "docker_registry_token" {
  type        = string
  sensitive   = true
  description = "The API token for uploading images"
}

variable "target_repository_name" {
  type        = string
  description = "The full name of the repository that is setup"
}

variable "gcp_project_id" {
  type        = string
  description = "The ID of the GCP project as the deployment target"
}

variable "gcp_sa_private_key" {
  type        = string
  description = "The private key of the GCP service account used for deployment"
}
