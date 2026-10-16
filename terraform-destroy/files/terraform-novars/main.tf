terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

// A file is enough: it is created on apply and removed on destroy, and
// terraform reports both, which is the only thing this lab is checking.
resource "local_file" "marker" {
  filename = "/tmp/instruqt-terraform-marker"
  content  = "created by the terraform-destroy example lab\n"
}

output "marker_path" {
  value = local_file.marker.filename
}
