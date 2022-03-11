variable "project_id" {
  type        = string
  sensitive   = true
  description = "The GCP project id"
}

variable "sa_email" {
  type        = string
  sensitive   = true
  description = "Email of the service account"
}
