data "google_client_config" "provider" {}

data "google_container_cluster" "my_cluster" {
  name     = "cluster-1"
  location = "us-central1-c"
  project = "testing-336413"
}

# provider "helm" {
#     kubernetes {
#     config_path = "~/.kube/config"
#   }
# }

provider "helm" {
  kubernetes {
    host  = "https://${data.google_container_cluster.my_cluster.endpoint}"
    token = data.google_client_config.provider.access_token
    cluster_ca_certificate = base64decode(
      data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate,
    )
  }
}

