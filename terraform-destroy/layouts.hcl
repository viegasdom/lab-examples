resource "layout" "terraform_destroy" {
  column {
    tab "terminal" {
      target = resource.terminal.shell
    }
  }

  column {
    instructions {}
  }
}
