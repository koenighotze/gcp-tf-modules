#trivy:ignore:avd-git-0001
resource "github_repository" "repository" {
  name        = var.target_repository_name
  description = "Repository for ${var.target_repository_name} in project ${var.project_id}"

  #checkov:skip=CKV_GIT_1:Public repos are fine
  visibility             = "public"
  archive_on_destroy     = true
  has_issues             = true
  has_projects           = false
  has_wiki               = false
  allow_auto_merge       = true
  delete_branch_on_merge = true
  auto_init              = true
  topics                 = ["gcp"]
  vulnerability_alerts   = true
}

resource "github_branch_protection" "main" {
  repository_id = github_repository.repository.id

  #checkov:skip=CKV_GIT_5:No 4 eyes needed
  pattern                         = "main"
  enforce_admins                  = false
  allows_deletions                = false
  require_conversation_resolution = true
  allows_force_pushes             = false
  require_signed_commits          = true
}
