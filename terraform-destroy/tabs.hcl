resource "terminal" "shell" {
  target            = resource.container.shell
  shell             = "/bin/bash"
  working_directory = "/root"
}
