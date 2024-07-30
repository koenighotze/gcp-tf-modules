terraform {
  required_version = "~> 1.8.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.52.0"
    }

    github = {
      source  = "hashicorp/github"
      version = ">= 4.0"
    }
  }
}
