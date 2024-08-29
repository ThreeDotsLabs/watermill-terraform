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

  homepage_url = var.url

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
