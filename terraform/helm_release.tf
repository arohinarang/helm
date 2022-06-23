resource "helm_release" "nginx_ingress" {
  name = "webapp-helm-chart"
  #   repository = "https://charts.bitnami.com/bitnami"
  chart = "../chart/mychart"
}