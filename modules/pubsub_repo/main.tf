terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  owner = "ThreeDotsLabs"
}

resource "github_repository" "repo" {
  name        = "watermill-${var.id}"
  description = "${var.name} Pub/Sub for the Watermill project."

  homepage_url = "https://watermill.io/pubsubs/${var.id}/"

  has_downloads = true
  has_issues    = false
  has_projects  = false
  has_wiki      = false

  allow_squash_merge = true
  allow_merge_commit = false
  allow_rebase_merge = false

  merge_commit_message        = "PR_TITLE"
  merge_commit_title          = "MERGE_MESSAGE"
  squash_merge_commit_message = "COMMIT_MESSAGES"
  squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"

  vulnerability_alerts = true
}

resource "github_branch_default" "master" {
  repository = github_repository.repo.name
  branch     = var.default_branch
}

resource "github_repository_file" "readme" {
  repository = github_repository.repo.name
  branch     = github_branch_default.master.branch
  file       = "README.md"
  content = templatefile("${path.module}/README.template.md", {
    id      = var.id
    name    = var.name
    details = var.details
  })
  commit_message      = "Update README.md (by Terraform)"
  overwrite_on_create = true
}
