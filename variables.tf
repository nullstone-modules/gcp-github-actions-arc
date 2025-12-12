variable "github_org" {
  type        = string
  description = <<EOF
This is the GitHub organization that owns the self-hosted runners.
This will be used to set githubConfigUrl="https://github.com/{var.github_org}".
EOF
}

variable "github_app_id" {
  type        = string
  description = <<EOF
This is the ID of the GitHub App that you created.
EOF
}

variable "github_app_installation_id" {
  type        = string
  description = <<EOF
This is the installation ID after installing the GitHub App registered to your GitHub organization.
EOF
}

variable "github_app_private_key" {
  type        = string
  sensitive   = true
  description = <<EOF
This is the `.pem` private key file for the GitHub App registered to your GitHub organization.
EOF
}
