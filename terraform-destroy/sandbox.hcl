resource "network" "main" {
  subnet = "10.0.5.0/24"
}

resource "container" "shell" {
  image {
    name = "ubuntu"
  }

  command = ["tail", "-f", "/dev/null"]

  network {
    id = resource.network.main.meta.id
  }
}

// Two arms of the same test. They do identical work and differ only in whether
// they declare variables, because the sdk writes terraform.tfvars only when
// they are present and terraformDestroy stats that file before running.
//
// Read the session log at teardown. Both arms log "Destroy Terraform"; only an
// arm that actually runs also logs "Running terraform destroy".
resource "terraform" "no_vars" {
  source = "files/terraform-novars"

  network {
    id = resource.network.main.meta.id
  }
}

resource "terraform" "with_vars" {
  source = "files/terraform-withvars"

  variables = {
    marker_suffix = "withvars"
  }

  network {
    id = resource.network.main.meta.id
  }
}
