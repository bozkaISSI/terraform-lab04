terraform {
  required_version = ">=1.7.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }

  backend "s3" {
  region = "eu-central-1"    # <- popraw na właściwy region
  bucket = "terraform-state-bozka123"
  key    = "lab04/terraform.tfstate"
}

}

provider "aws" {
  region = "us-east-1"
}

provider "github" {
  token = var.github_token
  owner = "bozkaISSI"
}
