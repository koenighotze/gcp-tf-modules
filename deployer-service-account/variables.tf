variable "gcp_project_id" {
  type        = string
  sensitive   = true
  description = "The GCP project id"
}

variable "name" {
  type        = string
  sensitive   = true
  description = "The name of the service account"
}
