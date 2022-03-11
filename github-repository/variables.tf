variable "codacy_api_token" {
  type        = string
  sensitive   = true
  description = "The API token for uploading coverage data"
  # tfsec:ignore:general-secrets-no-plaintext-exposure
  default     = ""
}

variable "docker_registry_username" {
  type        = string
  sensitive   = true
  description = "The username for uploading images"
  # tfsec:ignore:general-secrets-no-plaintext-exposure
  default     = ""
}

variable "docker_registry_token" {
  type        = string
  sensitive   = true
  description = "The API token for uploading images"
  # tfsec:ignore:general-secrets-no-plaintext-exposure
  default     = ""
}

variable "target_repository_name" {
  type        = string
  description = "The full name of the repository that is setup"
}

variable "project_id" {
  type        = string
  description = "The ID of the GCP project as the deployment target"
}

variable "workload_identity_provider_name" {
  type        = string
  description = "The name of the workload identity provider"
}

variable "workload_identity_pool_id" {
  type        = string
  description = "The id of the workload identity pool"
}

variable "deployer_service_account_email" {
  type        = string
  description = "The email of the service account used in ci/cd"
}

variable "github_admin_token" {
  type        = string
  sensitive   = true
  description = "The API Token for the GitHub API"
}

variable "github_non_admin_token" {
  type        = string
  sensitive   = true
  description = "The API Token for the GitHub API to be used on pull requests"
}

variable "terraform_state_bucket" {
  type        = string
  sensitive   = true
  description = "The name of the bucket to store TF state in"
}