// GitHub recommends placing runners in a separate namespace from the controller
// See https://docs.github.com/en/actions/tutorials/use-actions-runner-controller/deploy-runner-scale-sets#deploying-a-runner-scale-set
resource "kubernetes_namespace" "runners" {
  metadata {
    name = "${local.block_name}-runners"

    labels = {
      // k8s-recommended labels
      "app.kubernetes.io/name"       = "${local.block_name}-runners"
      "app.kubernetes.io/part-of"    = local.stack_name
      "app.kubernetes.io/managed-by" = "nullstone"
      // nullstone labels
      "nullstone.io/stack" = local.stack_name
      "nullstone.io/block" = local.block_name
      "nullstone.io/env"   = local.env_name
      "nullstone.io/ref"   = local.block_ref
    }
  }
}

resource "kubernetes_secret_v1" "github_app" {
  metadata {
    namespace = kubernetes_namespace.runners.metadata[0].name
    name      = "${local.resource_name}-github-app"
  }

  data = {
    "github_app_id"              = var.github_app_id
    "github_app_installation_id" = var.github_app_installation_id
    "github_app_private_key"     = var.github_app_private_key
  }
}
