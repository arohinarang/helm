terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0.1"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.25.0"
    }
  }
}