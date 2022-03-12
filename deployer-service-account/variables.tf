variable "project_id" {
  type        = string
  sensitive   = true
  description = "The GCP project id"
}

variable "name" {
  type        = string
  sensitive   = true
  description = "The name of the service account"
}

variable "additional_deployer_sa_roles" {
  default     = []
  description = "Additional roles that the deployer service account should own"
}