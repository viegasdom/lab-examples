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

// The subject of the test. Its providers need no credentials and no cloud
// account, so what the lab proves is only whether destroy runs: terraform's own
// output is streamed to the lab log, so "Destroy complete!" after the session
// ends is the signal.
resource "terraform" "marker" {
  source = "files/terraform"

  network {
    id = resource.network.main.meta.id
  }
}
