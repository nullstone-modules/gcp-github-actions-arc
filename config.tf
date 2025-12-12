resource "kubernetes_secret_v1" "github_app" {
  metadata {
    namespace = local.kubernetes_namespace
    name      = "${local.resource_name}-github-app"
  }

  data = {
    "github_app_id"              = var.github_app_id
    "github_app_installation_id" = var.github_app_installation_id
    "github_app_private_key"     = var.github_app_private_key
  }
}
