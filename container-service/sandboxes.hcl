resource "container" "new-container-for-test-party" {
  image {
    name = "ubuntu:22.04"
  }
  privileged = false
  resources {
    cpu    = 1000
    memory = 256
  }
  run_as {
    user  = "root"
    group = "root"
  }
}
