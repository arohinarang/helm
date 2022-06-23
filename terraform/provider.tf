data "google_client_config" "provider" {}

data "google_container_cluster" "my_cluster" {
  name     = "viram-gke"
  location = "us-central1-c"
  project  = "q-gcp-7959-genesysstaff-22-06"
}


provider "helm" {
  kubernetes {
    host  = "https://${data.google_container_cluster.my_cluster.endpoint}"
    token = data.google_client_config.provider.access_token
    cluster_ca_certificate = base64decode(
      data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate,
    )
  }
}

