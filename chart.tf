// Installs the ARC controller
// See https://docs.github.com/en/actions/tutorials/use-actions-runner-controller/quickstart#installing-actions-runner-controller
resource "helm_release" "arc" {
  name       = "arc"
  namespace  = local.kubernetes_namespace
  repository = "oci://ghcr.io/actions/actions-runner-controller-charts"
  chart      = "gha-runner-scale-set-controller"

  wait = true
}
