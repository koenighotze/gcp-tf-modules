variable "project_id" {
  type        = string
  sensitive   = false
  description = "The id of the project"
}

variable "location" {
  default = "europe-west3"
}

variable "project_name" {
  type        = string
  sensitive   = false
  description = "The name of the project"
}

variable "github_org_name" {
  default = "koenighotze"
}

variable "github_admin_token" {
  type        = string
  sensitive   = true
  description = "The API Token for the GitHub API"
}

variable "github_api_label_token" {
  type        = string
  sensitive   = true
  description = "The API Token for the GitHub API with fewer privileges used for pull requests"
}

variable "workload_identity_provider_name" {
  type        = string
  description = "The name of the workload identity provider"
}

variable "workload_identity_pool_id" {
  type        = string
  description = "The id of the workload identity pool"
}

variable "codacy_api_token" {
  type        = string
  sensitive   = true
  description = "The API token for uploading coverage data"
}

# tfsec:ignore:general-secrets-no-plaintext-exposure
variable "docker_registry_username" {
  type        = string
  sensitive   = true
  default     = ""
  description = "The username for uploading images"
}

# tfsec:ignore:general-secrets-no-plaintext-exposure
variable "docker_registry_token" {
  type        = string
  sensitive   = true
  default     = ""
  description = "The API token for uploading images"
}

variable "service_account_email" {
  type        = string
  sensitive   = true
  description = "The Email of the Admin service account for this project"
}

variable "container_registry" {
  type        = string
  sensitive   = false
  description = "The container registry for OCI images"
}

variable "additional_project_apis" {
  description = "List of additional apis to be activated on this project"
  default     = []
}
