// Installs the ARC controller
// See https://docs.github.com/en/actions/tutorials/use-actions-runner-controller/quickstart#installing-actions-runner-controller
resource "helm_release" "arc" {
  name       = "arc"
  namespace  = local.kubernetes_namespace
  repository = "oci://ghcr.io/actions/actions-runner-controller-charts"
  chart      = "gha-runner-scale-set-controller"

  wait = true
}

// Installs the runner scale set
// See https://docs.github.com/en/actions/tutorials/use-actions-runner-controller/quickstart#configuring-a-runner-scale-set
resource "helm_release" "scale_set" {
  name       = "arc-runner-set"
  namespace  = local.kubernetes_namespace
  repository = "oci://ghcr.io/actions/actions-runner-controller-charts"
  chart      = "gha-runner-scale-set"

  set = [
    {
      name  = "githubConfigUrl"
      value = "https://github.com/${var.github_org}"
    },
    {
      name  = "githubConfigSecret"
      value = kubernetes_secret_v1.github_app.metadata[0].name
    }
  ]

  depends_on = [helm_release.arc]
}
