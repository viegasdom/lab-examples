terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

// Declared and used, so the value in terraform.tfvars is never an undeclared
// variable. The arm only differs from terraform-novars by having a variable at
// all; the work it does is identical.
variable "marker_suffix" {
  type = string
}

resource "local_file" "marker" {
  filename = "/tmp/instruqt-terraform-marker-${var.marker_suffix}"
  content  = "created by the terraform-destroy example lab\n"
}

output "marker_path" {
  value = local_file.marker.filename
}
