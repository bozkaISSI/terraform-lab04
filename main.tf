terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = var.github_token
  owner = "bozkaISSI"
}

resource "github_repository" "repo" {
  name        = var.repository_name
  description = var.repository_description
  visibility  = "public"
}
