output "github_config_secret" {
  value = {
    name      = kubernetes_secret_v1.github_app.metadata[0].name
  }

  description = "string ||| The name of a Kubernetes secret containing the config to connect to a GitHub App. This secret is in the default runners namespace."
}

output "default_runners_namespace" {
  value       = kubernetes_namespace.runners.metadata[0].name
  description = "string ||| The Kubernetes namespace where the runners are deployed"
}
